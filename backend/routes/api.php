<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\ExamController;
use App\Http\Controllers\Api\QuestionController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    $data['data'] = $request->user();
    return response()->json($data);
});

Route::prefix('auth')->group(function () {
    Route::apiResource('login', LoginController::class);
    Route::apiResource('register', RegisterController::class);
});

Route::middleware('auth:sanctum')->group( function () {
    Route::apiResource('users', UserController::class);
    Route::apiResource('questions', QuestionController::class);
    Route::apiResource('exams', ExamController::class);
});