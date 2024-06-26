<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Button extends Model
{
    use HasFactory;

    public function prompt_question(){
        return $this->belongsTo(PromptQuestion::class);
    }
    
    public function user(){
        return $this->belongsTo(User::class);
    }
}
