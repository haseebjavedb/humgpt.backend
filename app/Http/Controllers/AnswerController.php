<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Answer;
use App\Models\Chat;
use Auth;
use Illuminate\Support\Str;

class AnswerController extends Controller
{
    public function generateChatId(){
        $part1 = Str::random(5);
        $part2 = Str::random(5);
        $part3 = Str::random(5);
        $part4 = Str::random(5);
        $chatId = $part1 . "-" . $part2 . "-" . $part3 . "-" . $part4;
        return $chatId;
    }
    public function saveAnswers(Request $request){
        $user_id = Auth::id();
        $questions = $request->questions;
        $prompt_question_id = $questions[0]["prompt_question_id"];
        $chat = new Chat();
        $chat->chatid = $this->generateChatId();
        $chat->user_id = $user_id;
        $chat->prompt_question_id = $prompt_question_id;
        $chat->save();
        foreach($questions as $question){
            $answer = new Answer();
            $answer->user_id = $user_id;
            $answer->question_id = $question["id"];
            $answer->user_id = $user_id;
            $answer->chat_id = $chat->id;
            $answer->answer = $question["answer"];
            $answer->save();
        }
        return response()->json(["chat_id" => $chat->chatid], 200);
    }
}
