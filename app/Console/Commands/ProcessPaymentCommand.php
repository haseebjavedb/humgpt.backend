<?php


namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\PaymentIntent;
use Carbon\Carbon;
use App\Models\PricingPlan;
use Illuminate\Support\Facades\Auth;


class ProcessPaymentCommand extends Command
{
    protected $signature = 'payment:process';
    protected $description = 'Process payments and renew subscriptions';

     public function handle()
    {
        $users = User::
        where('expire_date', '<', Carbon::now())
        ->orWhere('used_words', '>', 'no_words')
        ->get();

        if ($users->isEmpty()) {
            $this->info('No users need subscription renewal.');
            return;
        }

        foreach($users as $user){
            $expiryDate = Carbon::createFromFormat('Y-m-d H:i:s', $user->expire_date);
            $active = 0;
            $now = Carbon::now();

            if ($now->greaterThan($expiryDate) || $user->used_words >= $user->no_words) {
                           // Retrieve the pricing plan
            $plan = PricingPlan::find($user->product_id);

            // Process payment for subscription renewal
            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));

            try {
                // Delete existing customer if exists
                // if ($user->stripe_id) {
                    $stripeCustomer = Customer::retrieve($user->stripe_id);
                    // $session = Session::retrieve('cs_test_c1VmX5I01u60i0GGzJgf63bpO7lhoHAIt6iPwLvfRz6VOJoIc08JupDKRg');
                    //     $customer->delete();
                    // }

                // // Create a new customer and charge them
                // $stripeCustomer = Customer::create([
                //     'email' => $user->email,
                //     'name' => $user->name,
                //    // 'source' => $user->payment_token // Assuming you have a payment_token field in the User model
                // ]);

                // Store the customer ID in the user record
                // $user->stripe_id = $stripeCustomer->id;
               
               
                $stripeCustomer = null;
                
                if($user->stripe_id){
                    try {
                        $customer = Customer::retrieve($user->stripe_id);
                        $customer->delete();
                    } catch (\Exception $e) {
                        return response()->json(["message" => "Error: " . $e->getMessage()], 422);
                    }
                }
                $stripeCustomer = Customer::create(['email' => $user->email, 'name' => $user->name, 'source' => $user->token]);
                Log::info('Customer: ' . $stripeCustomer);


                $user->stripe_id = $stripeCustomer->id;
                  $customerId = $stripeCustomer->id;
                // Create a payment intent
                if($customerId){
                    $payment = PaymentIntent::create([
                        'amount' => $plan->monthly_price * 100,
                        'currency' => 'usd',
                        'customer' => $customerId,
                        'confirmation_method' => 'manual',
                        
                    ]);
                // Update user's subscription details
                $currentDate = Carbon::now();
                $dateAfterOneMonth = $currentDate->addMonths(1);
                // $user->no_words = $plan->no_words;
                $user->used_words = 0;
                $user->is_subscription_active = true;
                $user->subscribed_date = $currentDate;
                $user->expire_date = $dateAfterOneMonth;
                $user->save();              

                // Log renewal success
                $this->info("Subscription renewed for user {$payment}");
            }
         } catch (\Exception $e) {
                // Log renewal failure
                $this->error("Failed to renew subscription for user {$user->id}: {$e->getMessage()}");
            }
            }

            $user->is_subscription_active = $active;
            $user->save();
        }
    }
}

