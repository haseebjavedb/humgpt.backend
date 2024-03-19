<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PromptQuestion;
use App\Models\Question;
use App\Models\QuestionOption;
use App\Models\User;
use Auth;

class PromptQuestionController extends Controller
{
    public function savePrompt(Request $request){
        $request->validate([
            'category' => 'required',
            'name' => 'required',
            'description' => 'required',
        ]);
        $user = Auth::user();
        // $userId = 0;
        // if($user->user_type == 0){
        //     $userId = $user->id;
        // }
        if($request->id){
            $prompt = PromptQuestion::find($request->id);
        }else{
            $prompt = new PromptQuestion();
            $prompt->user_id = Auth::user()->user_type == 0 ? Auth::id() : 0;
        }
        $prompt->category_id = $request->category;
        $prompt->name = $request->name;
        $prompt->description = $request->description;
        $prompt->save();
        return response()->json(["prompt" => $prompt, "id" => $prompt->id], 200);
    }

    public function singlePrompt($id){
        $prompt = PromptQuestion::with('category')->find($id);
        return response()->json($prompt, 200);
    }

    public function allPrompts(Request $request){
        $prompts = PromptQuestion::with('category', 'user')->orderBy('id', 'DESC')->get();
        return response()->json($prompts, 200);
    }
    
    public function library(Request $request){
        $prompts = PromptQuestion::with('category', 'user')->where('user_id', 0)->orderBy('id', 'DESC')->get();
        return response()->json($prompts, 200);
    }
    
    public function systemPrompts(Request $request){
        $prompts = PromptQuestion::with('category', 'user')->where('user_id', 0)->orderBy('id', 'DESC')->get();
        return response()->json($prompts, 200);
    }
    
    public function myLibrary(Request $request){
        $prompts = PromptQuestion::with('category', 'user')->where('user_id', Auth::id())->orderBy('id', 'DESC')->get();
        return response()->json($prompts, 200);
    }

    public function updateStatus($id, $status){
        $prompt = PromptQuestion::find($id);
        $prompt->status = $status;
        $prompt->save();
        return response()->json(["message" => "status updated successfully"], 200);
    }
    
    public function userPrompts(Request $request){
        $prompts = PromptQuestion::with('category')->where('user_id', Auth::id())->orderBy('id', 'DESC')->get();
        return response()->json($prompts, 200);
    }

    public function homePagePrompts(){
        $all = PromptQuestion::with('category')->orderBy('id', 'DESC')->get();
        $prompts = PromptQuestion::with('category')->orderBy('id', 'DESC')->limit(6)->get();
        $prompts1 = PromptQuestion::with('category')->orderBy('id', 'ASC')->limit(4)->get();
        $prompts2 = PromptQuestion::with('category')->orderBy('id', 'DESC')->limit(4)->get();
        return response()->json(get_defined_vars(), 200);
    }

    public function deletePrompt($id){
        $questions = Question::where('prompt_question_id', $id)->get();
        foreach($questions as $q){
            QuestionOption::where('question_id', $q->id)->delete();
        }
        Question::where('prompt_question_id', $id)->delete();
        PromptQuestion::find($id)->delete();
        return response()->json(["message" => "Prompt deleted successfully"], 200);
    }

}
