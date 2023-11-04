<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function store(Request $request)
    {
        $this->validator($request->all())->validate();
        
        $email          = $request['email'];
        $password       = $request['password'];
        $user           = User::where('email', $email)->first();
        
        if (!$user || !Hash::check($password, $user->password)) {
            return response(['message' => 'Invalid credentials'], 503);
        }

        $accessToken            = $user->createToken(uniqid())->plainTextToken;
        $user->access_token     = $accessToken;
        $user->save();

        return response([
            'user'  => $user,
            'token' => $accessToken
        ], 200);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email'     => ['required'],
            'password'  => ['required'],
        ]);
    }
}
