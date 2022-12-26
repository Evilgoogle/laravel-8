<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function index()
    {
        $carts = $this->cartItemsConvert(Cart::findItems());
        $count = (object)[
            'count' => $carts->count(),
            'total' => $carts->sum('total_price'),
        ];

        return view('pages.cart', compact(['carts', 'count']));
    }

    public function addToCart(Request $request)
    {
        $session_id = session()->getId();
        $cart = Cart::findItemId($request->good_id, $session_id);

        if (isset($cart)){

            $cart = Cart::find($cart->id);
            $cart->session_id = $session_id;
            $cart->count = $cart->count + $request->count;
            $cart->save();
        } else {

            $cart = new Cart();
            $cart->session_id = $session_id;
            $cart->good_id = $request->good_id;
            $cart->count = $request->count;
            $cart->save();
        }

        $count = Cart::cartCountItem($request->good_id, $session_id);

        return response()->json(['count' => $count]);
    }

    public function cartCount()
    {
        $cart_count = Cart::cartCountItems();

        return response()->json(['cart_count' => $cart_count]);
    }

    public function cartAction(Request $request)
    {
        $cart_id = $request->cart_id;
        $action = $request->action;

        $this->cartItemAction($cart_id, $action);

        $cart = $this->cartItemConvert(Cart::findCart($cart_id));
        $carts = $this->cartItemsConvert(Cart::findItems());

        $count = [
            'count' => $carts->count(),
            'total' => round($carts->sum('total_price')),
        ];

        return response()->json(['count' => $count, 'cart' => $cart]);
    }

    public function remove(Request $request)
    {
        Cart::cartItemRemove($request->cart_id);

        $carts = $this->cartItemsConvert(Cart::findItems());
        $count = (object)[
            'count' => $carts->count(),
            'total' => round($carts->sum('total_price')),
        ];

        return response()->json(['count' => $count]);
    }

    public function cartItemAction($cart_id, $action)
    {
        if ($action == 'plus') {
            Cart::cartItemIncrement($cart_id);
        } elseif ($action == 'minus') {
            $count = Cart::select('count')->find($cart_id);
            if ($count->count > 1) {
                Cart::cartItemDecrement($cart_id);
            }
        }
    }

    public function cartClear()
    {
        Cart::cartClear();

        return back();
    }

}
