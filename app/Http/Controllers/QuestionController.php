<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;
use App\Models\QuestionOption;

class QuestionController extends Controller
{
    public function saveQuestion(Request $request){
        $validations = [
            'question' => "required",
            'question_type' => 'required|in:Options,Text',
            'hint' => "nullable",
        ];
        if($request->question_type == 'Options'){
            $validations['options'] = 'array|min:1';
        }
        $request->validate($validations);
        if($request->id){
            $question = Question::find($request->id);
        }else{
            $question = new Question();
        }
        $question->prompt_question_id = $request->prompt_question_id;
        $question->question = $request->question;
        $question->question_type = $request->question_type;
        $question->is_optional = $request->is_optional;
        $question->hint = $request->hint;
        $question->key = $request->key;
        $question->status = 1;
        $question->save();
        if($question->question_type == "Options"){
            if($request->id){
                QuestionOption::where('question_id', $request->id)->delete();
            }
            $options = $request->options;
            foreach($options as $option){
                $opt = new QuestionOption();
                $opt->question_id = $question->id;
                $opt->option = $option;
                $opt->save();
            }
        }
        return response()->json(["message" => "Question saved successfully"], 200);
    }

    public function singleQuestion($id){
        $question = Question::with('prompt_question', 'question_options')->find($id);
        return response()->json($question, 200);
    }

    public function allQuestions(){
        $questions = Question::with('prompt_question', 'question_options')->orderBy('id', 'DESC')->get();
        return response()->json($questions, 200);
    }
    
    public function allPrompQuestions($prompt_id, $order = "ASC"){
        $questions = Question::with('prompt_question', 'question_options')
            ->where('prompt_question_id', $prompt_id)
            ->orderBy('question_order', 'ASC')
            ->orderBy('id', 'ASC')
            ->get();
        return response()->json($questions, 200);
    }

    public function deleteQuestion($id){
        Question::find($id)->delete();
        QuestionOption::where('question_id', $id)->delete();
        return response()->json(["message" => "Question deleted successfully"], 200);
    }

    public function updateOrder(Request $request){
        $questions = $request->questions;
        $prompt_id = 0;
        
        foreach($questions as $question){
            $q = Question::find($question['id']);
            $q->question_order = $question['question_order'];
            $q->save();
            $prompt_id = $q->prompt_question_id;
        }
        
        $questions = Question::with('prompt_question', 'question_options')
            ->where('prompt_question_id', $prompt_id)
            ->orderBy('question_order', 'ASC')
            ->orderBy('id', 'ASC')
            ->get();
        return response()->json($questions, 200);
    }
}
