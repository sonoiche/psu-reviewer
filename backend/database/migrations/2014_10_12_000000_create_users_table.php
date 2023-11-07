<?php

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('fname');
            $table->string('mname')->nullable();
            $table->string('lname');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('mobile_number')->nullable();
            $table->enum('role', ['Admin', 'User'])->nullable();
            $table->integer('course_id')->nullable();
            $table->string('photo')->nullable();
            $table->text('access_token')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        $data = [
            ['fname' => 'Admin', 'lname' => 'User', 'email' => 'admin@gmail.com', 'password' => bcrypt('12345678'), 'role' => 'Admin', 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()]
        ];

        DB::table('users')->insert($data);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
