<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * cartItemsConvert - Подсчитает товары с учетом их скидки. Подсчитает обшую цену
     * @param $items
     * @return mixed
     */
    public function cartItemsConvert($items)
    {
        $new_items = $items->transform(function ($item) {

            $item->total_price = $item->count * ($item->price - ($item->price * ($item->discount / 100)));
            $item->price = $item->price - ($item->price * ($item->discount / 100));

            return $item;
        });

        return $new_items;
    }
}
