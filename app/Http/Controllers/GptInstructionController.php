<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\GptInstruction;
use App\Models\GptRole;

class GptInstructionController extends Controller
{
    public function saveInstruction(Request $request){
        $request->validate([
            'instruction' => 'required',
        ]);
        if($request->id){
            $ins = GptInstruction::find($request->id);
        }else{
            $ins = new GptInstruction();
        }
        $ins->gpt_role_id = $request->gpt_role_id;
        $ins->instruction = $request->instruction;
        $ins->save();
        $roles = GptRole::with('prompt_question', 'gpt_instructions')->orderBy('id', 'DESC')->get();
        return response()->json(["roles" => $roles, "message" => "Instruction saved successfully"], 200);
    }

    public function delete($id){
        $ins = GptInstruction::find($id);
        $role = GptRole::with('prompt_question', 'gpt_instructions')->find($ins->gpt_role_id);
        $ins->delete();
        return response()->json(["role" => $role, "message" => "Instruction deleted successfully"], 200);
    }
}
