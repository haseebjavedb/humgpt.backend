<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\GptInstruction;
use Illuminate\Http\Request;
use App\Models\GptRole;
use Auth;

class GptRoleController extends Controller
{
    public function saveRole(Request $request){
        $request->validate([
            'prompt' => 'required',
            'role' => 'required',
        ]);
        if($request->id){
            $role = GptRole::find($request->id);
        }else{
            $role = new GptRole();
            $role->user_id = Auth::user()->user_type == 0 ? Auth::id() : 0;
        }
        $role->prompt_question_id = $request->prompt;
        $role->role = $request->role;
        $role->save();

        $roles = GptRole::with('prompt_question', 'gpt_instructions')->orderBy('id', 'DESC')->get();

        return response()->json(["roles" => $roles, "message" => "Role saved successfully"], 200);
    }

    public function allRoles(){
        $roles = GptRole::with('prompt_question', 'gpt_instructions', 'user')->orderBy('id', 'DESC')->get();
        return response()->json(["roles" => $roles], 200);
    }
    
    public function userRoles(){
        $roles = GptRole::with('prompt_question', 'gpt_instructions')->where('user_id', Auth::id())->orderBy('id', 'DESC')->get();
        return response()->json(["roles" => $roles], 200);
    }

    public function single($id){
        $role = GptRole::with('prompt_question', 'gpt_instruction')->find($id);
        return response()->json(['role' => $role]);
    }

    public function delete($id){
        GptInstruction::where('gpt_role_id', $id)->delete();
        GptRole::find($id)->delete();
        $roles = GptRole::with('prompt_question', 'gpt_instructions')->orderBy('id', 'DESC')->get();

        return response()->json(["roles" => $roles, "message" => "Role deleted successfully"], 200);
    }
}
