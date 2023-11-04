<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\UserRequest;

class UserController extends Controller
{
    public function update(UserRequest $request, $id)
    {
        $user = User::find($id);
        $user->fname            = $request['fname'];
        $user->mname            = $request['mname'];
        $user->lname            = $request['lname'];
        $user->email            = $request['email'];
        $user->mobile_number    = $request['mobile_number'];

        if(isset($request['password'])) {
            $user->password     = bcrypt($request['password']);
        }
        $user->save();

        $data['statusCode']     = 200;
        $data['message']        = 'Personal Information has been saved.';
        return response()->json($data);
    }
}
