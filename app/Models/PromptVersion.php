<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PromptVersion extends Model
{
    use HasFactory;

    public function prompt(){
        return $this->belongsTo(Prompt::class);
    }
}
