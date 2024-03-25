<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PromptQuestion;
use App\Models\Button;
use App\Models\Chat;
use Illuminate\Support\Facades\DB;
use Log;

class AdminController extends Controller
{
    public function dashboardInfo(){
        $users = User::where('user_type', 0)->get();
        $templates = PromptQuestion::with('category')->orderBy('id', 'DESC')->get();
        $buttons = Button::orderBy('id', 'DESC')->get();
        $chats = Chat::orderBy('id', 'DESC')->get();
        return response()->json(get_defined_vars(), 200);
    }
    public function allChats(){
        $chats = Chat::with('user', 'prompt_question', 'prompt_question.category')->orderBy('id', 'DESC')->get();
        return response()->json($chats, 200);
    }

    
    public function singleChat($user_id){
        $chats = Chat::with('user', 'prompt_question', 'prompt_question.category')->where('user_id', $user_id)->orderBy('id', 'DESC')->get();
        return response()->json($chats, 200);
    }

    public function store(Request $request)
    {
        try {
          
    
            $apiKey = $request->api_key;
            $model = $request->model;
    
            // Use the DB facade to perform raw SQL operations
            DB::table('api_keys')->updateOrInsert(
                ['id' => 1], // You might want to reconsider the logic of hardcoding the ID.
                ['api_key' => $apiKey, 'model' => $model] // Storing the model and API key.
            );
    
            return response()->json(['message' => 'API key and model stored successfully']);
        } catch (\Exception $e) {
            // Log the detailed error for internal review.
            Log::error('Error storing API key and model: ' . $e->getMessage());
    
            // Return a generic error message to the client.
            return response()->json(['error' => 'An error occurred while storing the API key and model', $e->getMessage() ], 500);
        }
    }
    

public function getApiKey()
{
    try {
        $apiKey = DB::table('api_keys')->value('api_key');
        $model = DB::table('api_keys')->value('model'); // Retrieve the stored model

        if ($apiKey && $model) {
            return response()->json(['api_key' => $apiKey, 'model' => $model]);
        } else {
            return response()->json(['error' => 'API key or model not found'], 404);
        }
    } catch (\Exception $e) {
        // Log the error for debugging
        Log::error('Error fetching API key and model: ' . $e->getMessage());

        return response()->json(['error' => 'An error occurred while fetching the API key and model'], 500);
    }
}
}
