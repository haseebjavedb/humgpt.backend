<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chat;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    public function allChats(){
        $userId = Auth::id();
        $chats = Chat::with('prompt_question', 'prompt_question.category')->where('user_id', $userId)->orderBy('id', 'DESC')->get();
        return response()->json($chats, 200);
    }

    public function getChatfromid($chatid){
        $chat = Chat::with('messages')->where('chatid', $chatid)->first();
        return response()->json($chat, 200);
    }
}
