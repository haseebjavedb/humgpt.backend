<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GptInstruction extends Model
{
    use HasFactory;

    public function gpt_role(){
        return $this->belongsTo(GptRole::class);
    }
}
