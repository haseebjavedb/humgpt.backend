<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prompt extends Model
{
    use HasFactory;

    public function prompt_question(){
        return $this->belongsTo(PromptQuestion::class);
    }

    public function prompt_versions(){
        return $this->hasMany(PromptVersion::class);
    }
}
