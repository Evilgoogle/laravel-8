<?php

namespace App\Http\Controllers;

use App\Models\Goods;

class MainController extends Controller
{
    public function index()
    {
        return view('pages.main');
    }

    public function goods()
    {
        $items = Goods::orderBy('id')->limit(10)->get();

        return view('pages.goods', compact('items'));
    }
}
