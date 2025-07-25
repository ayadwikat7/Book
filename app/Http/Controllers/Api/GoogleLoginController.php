<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Google_Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class GoogleLoginController extends Controller
{
    public function handleGoogleLogin(Request $request)
    {
        $request->validate([
            'id_token' => 'required|string',
        ]);

        try {
            // تحقق من التوكن باستخدام Google Client
            $client = new Google_Client(['client_id' => env('GOOGLE_CLIENT_ID')]);
            $payload = $client->verifyIdToken($request->id_token);

            if (!$payload) {
                return response()->json(['message' => 'Invalid Google ID Token'], 401);
            }

            $googleEmail = $payload['email'];
            $googleName  = $payload['name'] ?? 'Google User';

            // البحث عن المستخدم أو إنشاء جديد
            $user = User::firstOrCreate(
                ['email' => $googleEmail],
                [
                    'name' => $googleName,
                    'password' => Hash::make(Str::random(16)), // كلمة مرور عشوائية
                ]
            );

            // إصدار توكن Sanctum
            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'message' => 'Login successful',
                'data' => [
                    'user' => $user,
                    'token' => $token
                ]
            ], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Google login failed', 'error' => $e->getMessage()], 500);
        }
    }
}
