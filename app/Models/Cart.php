<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Cart extends Model
{
    use HasFactory;

    public static function findItems()
    {
        $session_id = session()->getId();

        return DB::table('carts as c')
            ->select(
                'c.id',
                'g.title',
                'g.price',
                'g.discount',
                'c.count'
            )
            ->join('goods as g', 'g.id', '=', 'c.good_id')
            ->where('c.count', '>', 0)
            ->where('c.session_id', $session_id)
            ->orWhere('c.user_id', Auth::check() ? Auth::user()->id : null)
            ->get();
    }

    public static function findItemId($good_id, $session_id = null, $user = null)
    {
         $query = DB::table('carts as c')
            ->where('c.good_id', $good_id);

         if(Auth::check()) {
             $query->where('c.user_id', Auth::user()->id);
         } else {
             $query->where('c.session_id', $session_id);
         }

         return $query->first();
    }

    public static function cartCountItem($good_id, $session_id)
    {
        return DB::table('carts as c')
            ->where('c.good_id', $good_id)
            ->where('c.session_id', $session_id)
            ->value('count');
    }

    public static function cartCountItems($session_id)
    {
        return DB::table('carts as c')
            ->where('c.session_id', $session_id)
            ->sum('c.count');
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

    public static function cartItemIncrement($cart_id)
    {
        $session_id = session()->getId();

        return DB::table('carts as c')
            ->where('c.id', $cart_id)
            ->where('c.session_id', $session_id)
            ->increment('c.count', 1);
    }

    public static function cartItemDecrement($cart_id)
    {
        $session_id = session()->getId();

        return DB::table('carts as c')
            ->where('c.id', $cart_id)
            ->where('c.count', '>', 0)
            ->where('c.session_id', $session_id)
            ->decrement('c.count', 1);
    }

    public static function cartItemRemove($cart_id)
    {
        $session_id = session()->getId();

        return DB::table('carts')
            ->where('id', $cart_id)
            ->where('session_id', $session_id)
            ->delete();
    }

    public static function cartClear()
    {
        $session_id = session()->getId();

        $query = DB::table('carts');

        if(Auth::check()) {
            $query->where('user_id', Auth::user()->id);
        } else {
            $query->where('session_id', $session_id);
        }

        return $query->delete();
    }
}
