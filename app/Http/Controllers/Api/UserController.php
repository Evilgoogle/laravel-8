<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function login (Request $request)
    {
        $rules = [
            'email' => 'required',
            'password' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $user = User::where('email', $request->email)->first();
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response([
                    'error' => ['Authorization error. Login or password is not correct']
                ], 422);
            }

            $token = $user->createToken('app_token')->plainTextToken;

            $response = [
                'user' => $user,
                'token' => $token
            ];

            return response($response, 200);
        }
    }

    public function registration(Request $request)
    {
        $rules = [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:4',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $test_email = User::where('email', $request->email)->first();
            if($test_email) {
                return response([
                    'error' => 'This mail is already taken: '.$request->email
                ], 422);
            }

            $set = new User();
            $set->name = $request->name;
            $set->email = $request->email;
            $set->password = Hash::make($request->password);
            $result = $set->save();

            if($result) {

                return response([
                    'result' => 'Registration completed successfully'
                ], 200);
            } else {

                return response([
                    'error' => 'Operation failed'
                ], 422);
            }
        }
    }
}
