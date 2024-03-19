<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Button;
use Auth;

class ButtonController extends Controller
{
    public function saveButton(Request $request){
        $request->validate([
            'name' => 'required',
            'prompt' => 'required',
            'prompt_question_id' => 'required',
        ]);
        if($request->id){
            $btn = Button::find($request->id);
        }else{
            $btn = new Button();
            $btn->user_id = Auth::user()->user_type == 0 ? Auth::id() : 0;
        }
        $btn->name = $request->name;
        $btn->prompt = $request->prompt;
        $btn->prompt_question_id = $request->prompt_question_id;
        $btn->status = 1;
        $btn->save();
        $buttons = Button::orderBy('id', 'DESC')->get();
        return response()->json(["message" => "Button saved successfully", "buttons" => $buttons], 200);
    }
    public function singleButton($id){
        $button = Button::with('prompt_question')->find($id);
        return response()->json($button, 200);
    }
    public function promptButtons($prompt_question_id){
        $buttons = Button::with('prompt_question')->where('prompt_question_id', $prompt_question_id)->orderBy('id', 'DESC')->get();
        return response()->json(["buttons" => $buttons], 200);
    }
    public function allButtons(){
        $buttons = Button::with('prompt_question')->orderBy('id', 'DESC')->get();
        return response()->json(["buttons" => $buttons], 200);
    }
    public function userButtons(){
        $buttons = Button::with('prompt_question')->where('user_id', Auth::id())->orderBy('id', 'DESC')->get();
        return response()->json(["buttons" => $buttons], 200);
    }
    public function deleteButton($id){
        Button::find($id)->delete();
        $buttons = Button::orderBy('id', 'DESC')->get();
        return response()->json(["message" => "Button deleted successfully", "buttons" => $buttons], 200);
    }
}
