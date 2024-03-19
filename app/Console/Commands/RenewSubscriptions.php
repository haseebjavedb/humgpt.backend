<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Unicodeveloper\Paystack\Facades\Paystack;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class RenewSubscriptions extends Command
{
    protected $signature = 'subscriptions:renew';
    protected $description = 'Renew expired subscriptions';

    public function handle()
    {
        // Retrieve users with expired subscriptions
        $users = User::where('expire_date', '<', Carbon::now())->get();

        // Check if there are no users with expired subscriptions
        if ($users->isEmpty()) {
            $this->info('No subscriptions to renew.');
            return;
        }

        foreach ($users as $user) {
            // Process payment for subscription renewal
            $response = Paystack::transactionInitialize([
                'email' => $user->email,
                'amount' => $user->subscription_fee * 100, // Convert to kobo
                'reference' => 'RENEW_' . $user->id, // Unique reference for renewal
            ]);

            // Check if payment was successfully initialized
            if ($response['status']) {
                $reference = $response['data']['reference'];

                // Update user's subscription details
                $user->is_subscription_active = true;
                $user->subscribed_date = Carbon::now();
                $user->expire_date = Carbon::now()->addMonths(1); // Renew for one month
                $user->paystack_reference = $reference;
                $user->save();

                // Log renewal success
                $this->info("Subscription renewed for user {$user->id}");
            } else {
                // Log renewal failure
                $this->error("Failed to renew subscription for user {$user->id}: {$response['message']}");
            }
        }

        // Log overall command execution success
        $this->info('Subscriptions renewal command executed successfully');
    }
}