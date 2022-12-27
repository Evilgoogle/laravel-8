<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Goods;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class BusketController extends Controller
{
    public function add(Request $request)
    {
        $rules = [
            'good_id' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $isset = Goods::find($request->good_id);
            if(!isset($isset)) {
                return response([
                    'error' => ['Product not found: '.$request->good_id]
                ], 422);
            }

            $session_id = session()->getId();
            $user = Auth::check() ? Auth::user()->id : null;
            $cart = Cart::findItemId($request->good_id, $session_id, $user);
            $count = 1;

            if (isset($cart)) {

                $cart = Cart::find($cart->id);
                $cart->session_id = $session_id;
                $cart->user_id = Auth::check() ? Auth::user()->id : null;
                $cart->count = $cart->count + $count;
                $cart->save();
            } else {

                $cart = new Cart();
                $cart->session_id = $session_id;
                $cart->user_id = Auth::check() ? Auth::user()->id : null;
                $cart->good_id = $request->good_id;
                $cart->count = $count;
                $cart->save();
            }

            return response([
                'result' => 'Item added to user\'s cart'
            ], 200);
        }
    }

    public function update(Request $request)
    {
        $rules = [
            'good_id' => 'required',
            'count' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $isset = Cart::find($request->good_id);
            if(!isset($isset)) {
                return response([
                    'error' => ['Product not found: '.$request->good_id]
                ], 422);
            }

            $user = Auth::check() ? Auth::user()->id : null;
            $cart = Cart::findItemId($request->good_id, null, $user);

            if (isset($cart)) {
                $cart = Cart::find($cart->id);
                $cart->count = ($request->count < 1) ? 1 : $request->count;
                $cart->save();
            }

            return response([
                'result' => 'Quantity changed'
            ], 200);
        }
    }

    public function del(Request $request)
    {
        $rules = [
            'good_id' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $isset = Cart::find($request->good_id);
            if(!isset($isset)) {
                return response([
                    'error' => ['Product not found: '.$request->good_id]
                ], 422);
            }

            $user = Auth::check() ? Auth::user()->id : null;
            $cart = Cart::findItemId($request->good_id, null, $user);

            if (isset($cart)) {
                $cart = Cart::find($cart->id);
                $cart->delete();
            }

            return response([
                'result' => 'Product removed'
            ], 200);
        }
    }
}
