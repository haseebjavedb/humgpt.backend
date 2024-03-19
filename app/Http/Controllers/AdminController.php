<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PromptQuestion;
use App\Models\Button;
use App\Models\Chat;

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
}
