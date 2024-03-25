<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PromptQuestion;
use App\Models\Chat;
use Stripe\Stripe;
use Stripe\Product;
use Stripe\Price;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\PricingPlan;
use Laravel\Socialite\Facades\Socialite;

class UserController extends Controller
{
    public function allUsers()
    {
        $users = User::where('user_type', 0)->orderBy('id', 'DESC')->get();
        return response()->json($users, 200);
    }

    public function countWords($string)
    {
        $words = str_word_count($string);
        return $words;
    }

    public function countCharacters($string)
    {
        $characters = strlen($string);
        return $characters;
    }
    public function dashboardStats()
    {
        $userId = Auth::id();
        // Assuming the user model has a 'plan_name' attribute
        $userPlan = User::where('id', $userId)->value('plan_name');
        
        // Set word limits based on the user's plan
        $wordLimits = [
            'silver' => 3000,
            'gold' => 4000,
            'bronze' => 2000,
        ];
        $userWordLimit = isset($wordLimits[strtolower($userPlan)]) ? $wordLimits[strtolower($userPlan)] : 20; // Default to bronze if plan is not found or undefined
    
        $chats = Chat::with('messages')->where('user_id', $userId)->get();
        $totalWords = 0;
        $totalCharacters = 0;
        $allTemplates = [];
        foreach ($chats as $chat) {
            foreach ($chat->messages as $msg) {
                $totalWords += $this->countWords($msg->message);
                $totalCharacters += $this->countCharacters($msg->message);
            }
            if (!in_array($chat->prompt_question_id, $allTemplates)) {
                array_push($allTemplates, $chat->prompt_question_id);
            }
        }
        $recentTemplates = [];
        for ($i = 0; $i < count($allTemplates); $i++) {
            if ($i < 4) { // Adjusted to < 4 to include up to 4 recent templates
                array_push($recentTemplates, $allTemplates[$i]);
            }
        }
        $templates = PromptQuestion::with('category')
            ->whereIn('id', $recentTemplates)
            ->orderBy('id', 'DESC')
            ->get();
    
        // Add userWordLimit to the response
        return response()->json(compact('totalWords', 'totalCharacters', 'templates', 'userWordLimit'), 200);
    }
    

  
    public function userInfo(){
        $userId = Auth::user()->id;
        $user = User::find($userId);

        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));

        $plan = PricingPlan::find($user->product_id);

        // $product = Product::retrieve($user->product_id);
        // $price = Price::retrieve($product->default_price);
        // $product->unit_amount = $price->unit_amount / 100;
        // $product->currency = strtoupper($price->currency);

        // if (isset($price->recurring) && isset($price->recurring->interval)) {
        //     $product->interval = $price->recurring->interval;
        // }

        return response()->json(["user" => $user, "plan" => $plan], 200);
    }

    public function updatePicture(Request $request)
    {
        $request->validate([
            'profile_pic' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);
        $user = User::find(Auth::id());
        $user->profile_pic = $this->uploadImage($request, 'profile_pic');
        $user->save();

        return response()->json(["message" => "Profile picture updated"], 200);
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'password' => 'required|min:8|confirmed',
        ]);
        $user = User::find(Auth::id());
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json(["message" => "Password updated successfully"], 200);
    }


    public function Delete(string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(["message" => "User not Found"], 404);
        }
    
        $user->delete();
        return response()->json(["message" => "Deleted Successfully"], 200);
    }
    

    public function Plans(Request $request, string $id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json(["message" => 'No record found'], 404);
        } else {
            $user->product_id = $request->input('product_id');
            $user->plan_name = $request->input('plan_name');
            $user->save();
        }

        return response()->json(["message" => 'User updated successfully'], 200);
    }


    public function getplans(string $id)
    {
        // Find the user by their ID
        $user = User::find($id);

        if (!$user) {
            return response()->json(["message" => 'No record found'], 404);
        }

        // Assuming you want to return the user data in the response
        return response()->json(["message" => 'User found', 'user' => $user], 200);
    }

    public function redirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleProviderCallback()
    {
        $user = Socialite::driver('google')->user();
        $user->token;
    }


    public function index($id)
    {
        // Retrieve the user from the database based on the provided ID
        $user = User::find($id);
    
        if(!$user) {
            // If no user found with the given ID, return a not found response
            return response()->json(['error' => 'User not found'], 404);
        }
    
        // Return the user's data as a JSON response
        return response()->json($user, 200);
    }
    
    
}
