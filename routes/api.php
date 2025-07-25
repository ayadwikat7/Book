<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use App\Http\Controllers\Api\GoogleLoginController;
use App\Http\Controllers\Api\BookController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// تسجيل مستخدم جديد
Route::post('/register', [AuthController::class, 'register']);

// تسجيل الدخول
Route::post('/login', [AuthController::class, 'login']);

// تسجيل الدخول باستخدام Google
Route::post('/google-login', [GoogleLoginController::class, 'handleGoogleLogin']);

// إرسال رابط التحقق إلى البريد
Route::post('/email/verification-notification', function (Request $request) {
    $request->user()->sendEmailVerificationNotification();
    return response()->json(['message' => 'Verification link sent!']);
})->middleware(['auth:sanctum', 'throttle:6,1'])->name('verification.send');

// التحقق من البريد عند فتح الرابط
Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
    $request->fulfill();
    return response()->json(['message' => 'Email verified successfully']);
})->middleware(['signed'])->name('verification.verify');

// بيانات المستخدم بعد تسجيل الدخول
Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/books', [BookController::class, 'index']); 
Route::get('/books/recommended', [BookController::class, 'recommended']); 
Route::get('/books/best-seller', [BookController::class, 'bestSeller']);
Route::get('/books/flash-sale', [BookController::class, 'flashSale']);
Route::get('/books/{id}', [BookController::class, 'show']);
