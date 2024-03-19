<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PromptQuestion extends Model
{
    use HasFactory;

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function questions(){
        return $this->hasMany(Question::class);
    }

    public function prompt(){
        return $this->hasOne(Prompt::class);
    }

    public function gpt_role(){
        return $this->hasOne(GptRole::class);
    }

    public function chats(){
        return $this->hasMany(Chat::class);
    }

    public function buttons(){
        return $this->hasMany(Button::class);
    }
}
