<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Prompt;
use App\Models\PromptVersion;

class PromptVersionController extends Controller
{
    public function restoreVersion($version_id){
        $version = PromptVersion::find($version_id);
        $prompt = Prompt::find($version->prompt_id);
        $prompt->prompt = $version->prompt;
        $prompt->save();

        $p = Prompt::with(['prompt_question', 'prompt_versions'])->find($prompt->id);

        return response()->json(["message" => "Restored to version '$version->message'", "prompt" => $p], 200);
    }
}
