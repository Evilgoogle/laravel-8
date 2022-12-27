<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderGood;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function add(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'phone' => 'required',
            'address' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $get = User::where('id', $request->user_id)->first();
            if(isset($get)) {

                $carts = $this->cartItemsConvert(Cart::findItems());
                if(!count($carts)) {
                    return response()->json(['buy' => ['Busket is empty']], 422);
                }
                $sum = $carts->sum('total_price');

                $order = new Order();
                $order->session_id = session()->getId();
                $order->user_id = $request->user_id;
                $order->name = Auth::user()->name;
                $order->phone = $request->phone;
                $order->email = Auth::user()->email;
                $order->address = $request->address;
                $order->sum = $sum;
                $order->save();

                foreach ($carts as $cart) {
                    $good = new OrderGood();
                    $good->order_id = $order->id;
                    $good->title = $cart->title;
                    $good->price = $cart->price;
                    $good->count = $cart->count;
                    $good->save();
                }
                Cart::cartClear();

                return response([
                    'result' => 'Order completed successfully'
                ], 200);
            } else {
                return response([
                    'error' => 'User is not found: '.$request->user_id
                ], 422);
            }
        }
    }

    public function show(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            $isset = User::where('id', $request->user_id)->first();
            if(isset($isset)) {
                $get = Order::where('user_id', $request->user_id)->get();

                return response([
                    'result' => $get
                ], 200);
            } else {
                return response([
                    'error' => 'User is not found: '.$request->user_id
                ], 422);
            }
        }
    }
}
