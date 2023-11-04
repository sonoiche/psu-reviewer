<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function store(Request $request)
    {
        $this->validator($request->all())->validate();
        // return $request->all();
        $user = new User;
        $user->fname            = $request['fname'];
        $user->lname            = $request['lname'];
        $user->email            = $request['email'];
        $user->mobile_number    = $request['mobile_number'];
        $user->password         = bcrypt($request['password']);
        $user->save();

        $userInfo               = User::find($user->id);
        $accessToken            = $userInfo->createToken(uniqid())->plainTextToken;
        $userInfo->access_token = $accessToken;
        $userInfo->save();

        $data['token']          = $accessToken;
        $data['success']        = true;
        return response()->json($data);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'fname'         => ['required', 'string', 'max:255'],
            'lname'         => ['required', 'string', 'max:255'],
            'mobile_number' => ['required', 'string', 'max:255'],
            'email'         => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password'      => ['required', 'string', 'min:8'],
        ]);
    }
}
