<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('gpt_instructions', function (Blueprint $table) {
            $table->id();
            $table->integer('gpt_role_id');
            $table->text('instruction');
            $table->tinyInteger('status')->default(1); // 1:Active 0:Not Active
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gpt_instructions');
    }
};
