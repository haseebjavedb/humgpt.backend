<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Product;
use Stripe\Price;
use Stripe\Customer;
use Stripe\Subscription;
use App\Models\User;
use Carbon\Carbon;
use Stripe\PaymentIntent;
use App\Models\PricingPlan;
// use App\Models\BillingHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use App\Models\PlanFeature;


class StripeController extends Controller
{
    public function allProducts(){
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        $products = [];
        try {
            $products = Product::all();
            foreach($products->data as $product){
                $price = Price::retrieve($product->default_price);
                $product->unit_amount = $price->unit_amount / 100;
                $product->currency = strtoupper($price->currency);
                $product->interval = $price->recurring->interval;
            }
            return response()->json($products, 200);
        } catch (\Exception $e) {
            return response()->json(["message" => "Error: " . $e->getMessage()], 422);
        }
    }

    public function singleProduct($product_id) {
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
    
        try {
            $product = Product::retrieve($product_id);    
            $price = Price::retrieve($product->default_price);
            $product->unit_amount = $price->unit_amount / 100;
            $product->currency = strtoupper($price->currency);
    
            if (isset($price->recurring) && isset($price->recurring->interval)) {
                $product->interval = $price->recurring->interval;
            }
    
            return response()->json($product, 200);
        } catch (\Exception $e) {
            return response()->json(["message" => "Error: " . $e->getMessage()], 422);
        }
    }


    

 
    public function processPayment(Request $request){
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        $plan_id = $request->plan_id;
        Log::info('Received plan ID: ' . $plan_id);
        $user = Auth::user(); // Access the authenticated user
        $stripeCustomer = null;
        $plan = PricingPlan::find($plan_id);
        Log::info('Received plan: ' . $plan);
        if($user->stripe_id){
            try {
                $customer = Customer::retrieve($user->stripe_id);
                $customer->delete();
            } catch (\Exception $e) {
                return response()->json(["message" => "Error: " . $e->getMessage()], 422);
            }
        }
        $stripeCustomer = Customer::create(['email' => $user->email, 'name' => $user->name, 'source' => $request->token]);
        $user->stripe_id = $stripeCustomer->id;
        $customerId = $stripeCustomer->id;
        if($customerId){
            $payment = PaymentIntent::create([
                'amount' => $plan->monthly_price * 100,
                'currency' => 'usd',
                'customer' => $customerId,
            ]);
            $currentDate = Carbon::now();
            $dateAfterOneMonth = $currentDate->addMonths(1);
            $user->is_subscription_active = 1;
            $user->product_id = $plan->id;
            $user->plan_name = $plan->plan_name;
            $user->subscribed_date = $currentDate;
            $user->expire_date = $dateAfterOneMonth;
    
            // Adjust word limit based on plan
            if ($user->plan_name === 'Gold') {
                $user->no_words = 30000; // Double the word limit
            } elseif ($user->plan_name === 'Silver') {
                $user->no_words = 20000; // Double the word limit
            } elseif ($user->plan_name === 'Bronze') {
                $user->no_words = 10000; // Double the word limit
            }
    
            // Reset used words to zero
            $user->used_words = 0;
    
            $messageWords = str_word_count($request->message);
        
            // Deduct the words used from the user's word limit
            $user->no_words -= $messageWords;
            
            // Update used words
            $user->used_words += $messageWords;
    
            // Save the updated user
            $user->save();
            
            return response()->json(["message" => "$plan->plan_name subscribed successfully", "user" => $user], 200);
        } else {
            return response()->json(["message" => "Unable to process payment"], 422);
        }
    }
    
    public function processPayment2(Request $request)
    {
        // Retrieve the authenticated user
        $user = Auth::user();
    
        // Ensure user is retrieved
        if (!$user) {
            return response()->json(["message" => "User not found"], 404);
        }
    
        // Extract data from the request
        $planId = $request->product_id;
        $planName = $request->planName;
        $reference = $request->reference;

        // $plan_feature = PlanFeature::all();
        // log::info('features' , $plan_feature);
        
    
        try {
            // Update user's subscription details
            $currentDate = Carbon::now();
            $dateAfterOneMonth = $currentDate->addMonths(1);
            $user->is_subscription_active = 1;
            
            $user->product_id = $planId;
            $user->plan_name = $planName;
            $user->subscribed_date = $currentDate;
            $user->expire_date = $dateAfterOneMonth;
    
            // Adjust word limit based on plan
            if ($user->plan_name === 'Gold') {
                $user->no_words = 30000; // Double the word limit
            } elseif ($user->plan_name === 'Silver') {
                $user->no_words = 20000; // Double the word limit
            } elseif ($user->plan_name === 'Bronze') {
                $user->no_words = 10000; // Double the word limit
            }
    
            // Reset used words to zero
            $user->used_words = 0;
    
            $messageWords = str_word_count($request->message);
        
            // Deduct the words used from the user's word limit
            $user->no_words -= $messageWords;
            
            // Update used words
            $user->used_words += $messageWords;
    
            // Save the updated user
            $user->save();
    
           
            return response()->json([
                "message" => "$planName subscribed successfully",
                "transaction_reference" => $reference,
                "user" => $user
            ], 200);
        } catch (\Exception $e) {
            // Handle exceptions
            return response()->json(["message" => "Error: " . $e->getMessage()], 422);
        }
    }
    
    
    
}