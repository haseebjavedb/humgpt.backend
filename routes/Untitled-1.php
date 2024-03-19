<?php

namespace App\Http\Controllers;

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
use App\Models\Action;

use Auth;

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

    public function processPayment(Request $request , ){
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        $plan_id = $request->plan_id;
        $user = Auth::user();
        $userId = Auth::user()->id;
        $user = User::find($userId);
        $stripeCustomer = null;
        $plan = PricingPlan::find($plan_id);
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
            // $user->no_words = $plan->no_words;
            $user->save();
            // $billing = new BillingHistory();
            // $billing->user_id = $user->id;
            // $billing->pricing_plan_id = $plan->id;
            // $billing->plan_name = $plan->plan_name;
            // $billing->price = $plan->monthly_price;
            // $billing->save();
            
            return response()->json(["message" => "Unable to process payment"], 422);
        }
    }
}



public function processPayment(Request $request){
    Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
    $plan_id = $request->plan_id;
    $userId = Auth::user()->id; 
    $user = User::find($userId);
    $stripeCustomer = null;
    $plan = PricingPlan::find($plan_id);
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
    
        $user->save();
        $billing = new BillingHistory();
        $billing->user_id = $user->id;
        $billing->pricing_plan_id = $plan->id;
        $billing->plan_name = $plan->plan_name;
        $billing->price = $plan->monthly_price;
        $billing->save();
        $ActivatedPlan = $plan->plan_name . ' Activation';
        $action = Action::where('action', $ActivatedPlan)->first();
        if($action){
            $this->createContactInList($user->email, $user->name,$action->list_id );
        }
        $action = Action::where('action', 'Paid Subscribers')->first();
        if($action){
            $this->createContactInList($user->email, $user->name,$action->list_id );
        }
        return response()->json(["message" => "$plan->plan_name subscribed successfully", "user" => $user], 200);
    }else{
        return response()->json(["message" => "Unable to process payment"], 422);
    }
}