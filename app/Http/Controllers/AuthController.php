<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Jobs\VerifyEmailJob;
use Laravel\Socialite\Facades\Socialite;
use Carbon\Carbon ;
use Illuminate\Support\Str;





class AuthController extends Controller
{
    public function register(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->no_words= 1000;
        $user->save();

        $this->sendCode($user->id);

        return response()->json([
            "message" => "You are registered successfully. Please verify your email to continue",
            "user_id" => $user->id,
        ], 200);
    }

    public function sendCode($user_id){
        $user = User::find($user_id);
        $code = rand(100000, 999999);
        $data = [
            'email' => $user->email,
            'code' => $code,
        ];
        VerifyEmailJob::dispatch($data);
        $user->code = $code;
        $user->save();
    }

    public function resendEmail(Request $request){
        $request->validate([
            'user_id' => "required|numeric",
        ]);
        $this->sendCode($request->user_id);
        return response()->json(["message" => "Code resent to your email address"], 200);
    }

    public function verifyEmail(Request $request){
        $request->validate([
            'code' => "required|digits:6|numeric",
            'user_id' => "required|numeric",
        ]);
        $user = User::find($request->user_id);
        if($user){
            if($user->code == $request->code){
                $user->email_verified_at = date('Y-m-d H:i:s');
                $user->code = "";
                $user->save();
                $token = $user->createToken('user_token')->plainTextToken;
                return response()->json([
                    "message" => "Email verified successfully. Logging In",
                    "user" => $user,
                    "token" => $token,
                ], 200);
            }else{
                return response()->json(["message" => "Invalid verification code. Enter the code you received on your email"], 422);
            }
        }else{
            return response()->json(["message" => "Invalid request"], 422);
        }
    }

    public function login(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $email = $request->email;
        $password = $request->password;
        
        if(Auth::attempt(['email' => $email, 'password' => $password])){
            if(Auth::user()->hasVerifiedEmail()){
                $user = Auth::user();
                $token = $user->createToken('user_token')->plainTextToken;
                return response()->json([
                    "message" => "Logged in successfully",
                    "user" => $user,
                    "token" => $token,
                ], 200);
            }else{
                return response()->json(["message" => "Your email is not verified."], 422);    
            }
        }else{
            return response()->json(["message" => "Invalid email or password"], 422);
        }
    }

    public function forgotPassword(Request $request){
        $request->validate([
            'email' => 'required|email',
        ]);
        $user = User::where('email', $request->email)->first();
        if($user){
            $this->sendCode($user->id);
            return response()->json([
                "message" => "An OTP has been sent your email address. Check you inbox",
                "user_id" => $user->id,
            ], 200);
        }else{
            return response()->json(["message" => "No account found with this email address"], 422);
        }
    }

    public function verifyForgotEmail(Request $request){
        $request->validate([
            'code' => "required|digits:6|numeric",
            'user_id' => "required|numeric",
        ]);
        $user = User::find($request->user_id);
        if($user){
            if($user->code == $request->code){
                $user->email_verified_at = date('Y-m-d H:i:s');
                $user->code = "";
                $user->save();
                return response()->json([
                    "message" => "Email verified successfully. Create a new password for your account",
                    "user_id" => $user->id,
                ], 200);
            }else{
                return response()->json(["message" => "Invalid verification code. Enter the code you received on your email"], 422);
            }
        }else{
            return response()->json(["message" => "Invalid request"], 422);
        }
    }

    public function recoverPassword(Request $request){
        $request->validate([
            'password' => 'required|min:8|confirmed',
        ]);
        $user = User::find($request->user_id);
        if($user){
            $user->password = Hash::make($request->password);
            $user->save();
            return response()->json(["message" => "Your password has been updated. Login to continue"], 200);
        }else{
            return response()->json(["message" => "Invalid request"], 422);
        }
    }

    public function redirectToGoogle()
    {
        if (Auth::check()) {
            return redirect('/home');
        }
        
        return Socialite::driver('google')->redirect();
    }
    
    public function handleGoogleCallback()
    {
        try {
            $googleUser = Socialite::driver('google')->user();
    
            $user = User::where('email', $googleUser->email)->first();
            
            if ($user) {
                if (empty($user->google_id)) {
                    $user->google_id = $googleUser->id;
                    $user->verified = true;
                     $user->no_words= 1000;

                    $user->save();
                }
            } else {
                $user = User::create([
                    'name' => $googleUser->name,
                    'email' => $googleUser->email,
                    'password' => Hash::make(uniqid()),
                    'google_id' => $googleUser->id,
                    'verified' => true,
                    'no_words'=> 1000,
                ]);
            }
    
            Auth::login($user, true);
    
            
        } catch (\Exception $e) {
            // Log the exception for debugging
            // Log::error($e);
    
            return redirect('/login')->withErrors('Something went wrong or the user has denied access.');
        }
    }
    
    public function handleGoogleToken(Request $request)
    {
        $token = $request->token;
        try {
            $socialUser = Socialite::driver('google')->userFromToken($token);
    
            // Example of checking and creating/updating the user is shown in previous responses.
    
            return response()->json(['message' => 'User authenticated', 'user' => $socialUser]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Invalid token'], 401);
        }
    }
    



    public function googleLogin(Request $request)
    {
        $data = $request->only(['name', 'email', 'googleId']);
        
        // Check if the 'googleId' key exists in the $data array
        if (isset($data['googleId'])) {
            $user = User::updateOrCreate(
                ['google_id' => $data['googleId']],
                [
                    'name' => $data['name'],
                    'email' => $data['email'],
                    'password' => bcrypt('default_password'), // Set default password here
                    'email_verified_at' => Carbon::now()
                ]
            );
            
            // Explicitly save the user model to update email_verified_at
            $user->save();
            
            // Generate a token for the user
            $token = $user->createToken('user_token')->plainTextToken;
            
            // Return a response indicating successful login
            return response()->json([
                'message' => 'Google login successful',
                'user' => $user,
                'token' => $token,
                'needs_verification' => false // Since the user is verified, set this to false
            ]);
        } else {
            // Handle the case where 'googleId' key is missing in the incoming data
            return response()->json([
                'message' => 'Google login failed: GoogleId missing',
            ], 400); // Return 400 Bad Request status code
        }
    }
    

}
