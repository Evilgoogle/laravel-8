<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderGood;
use App\Models\Cart;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $carts = $this->cartItemsConvert(Cart::findItems());
        $sum = $carts->sum('total_price');

        return view('pages.ordering', compact('sum'));
    }

    public function order(Request $request)
    {
        $carts = $this->cartItemsConvert(Cart::findItems());
        if(!count($carts)) {
            return response()->json(['buy' => ['Корзина пуста']], 422);
        }
        $sum = $carts->sum('total_price');

        $order = new Order();
        $order->session_id = session()->getId();
        $order->name = $request->name;
        $order->phone = $request->phone;
        $order->email = $request->email;
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

        return response()->json('ok');
    }
}
