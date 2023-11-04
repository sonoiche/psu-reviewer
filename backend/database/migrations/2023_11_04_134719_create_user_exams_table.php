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
        Schema::create('user_exams', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('question_id');
            $table->integer('course_id')->nullable();
            $table->string('category')->nullable();
            $table->string('user_answer')->nullable();
            $table->string('correct_answer')->nullable();
            $table->enum('status', ['Correct','Wrong'])->nullable();
            $table->date('date_submitted')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_exams');
    }
};
