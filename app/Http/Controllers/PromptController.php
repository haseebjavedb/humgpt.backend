<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Prompt;
use App\Models\PromptVersion;
use Auth;

class PromptController extends Controller
{
    public function savePrompt(Request $request){
        $request->validate([
            'prompt' => 'required',
            'message' => "required",
        ]);
        if($request->id){
            $prompt = Prompt::find($request->id);
        }else{
            $prompt = new Prompt();
            $prompt->user_id = Auth::user()->user_type == 0 ? Auth::id() : 0;
        }
        $prompt->prompt_question_id = $request->prompt_question_id;
        $prompt->prompt = $request->prompt;
        $prompt->status = 0;
        $prompt->save();

        $prompt_v = new PromptVersion();
        $prompt_v->prompt_id = $prompt->id;
        $prompt_v->message = $request->message;
        $prompt_v->prompt = $prompt->prompt;
        $prompt_v->save();

        $prm = Prompt::with(['prompt_question', 'prompt_versions'])->find($prompt->id);

        return response()->json(["message" => "Prompt saved successfully", "prompt" => $prm], 200);
    }

    public function getPrompt($id){
        $prompt = Prompt::with(['prompt_question', 'prompt_versions'])->where('prompt_question_id', $id)->first();
        return response()->json(["prompt" => $prompt]);
    }
    
    public function findPrompt($id){
        $prompt = Prompt::with(['prompt_question', 'prompt_versions', 'prompt_question.questions', 'prompt_question.questions.question_options'])->find($id);
        return response()->json(["prompt" => $prompt]);
    }

    public function publishPrompt($id){
        $prompt = Prompt::find($id);
        $prompt->status = 1;
        $prompt->save();
        return response()->json(["message" => "Your prompt is published"], 200);
    }
}
