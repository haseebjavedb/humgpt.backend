<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GptRole extends Model
{
    use HasFactory;

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function prompt_question(){
        return $this->belongsTo(PromptQuestion::class);
    }

    public function gpt_instructions(){
        return $this->hasMany(GptInstruction::class);
    }
}
