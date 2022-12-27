<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\GoodProperty;
use App\Models\Goods;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GoodsController extends Controller
{

    public function cats()
    {
        return response($this->cat_recursion(Category::where('parent', 0)->get()), 200);
    }

    private function cat_recursion($cats)
    {
        $data = [];

        foreach ($cats as $item) {
            $db = Category::where('parent', $item->id)->get();

            $child = [];
            if ($db->count() > 0) {
                foreach ($db as $d) {
                    array_push($child, (object)[
                        'id' => $d->id,
                        'enable' => $d->enable,
                        'level' => $d->level,
                        'title' => $d->title,
                    ]);
                }
            }
            array_push($data, (object)[
                'id' => $item->id,
                'enable' => $item->enable,
                'level' => $item->level,
                'title' => $item->title,
                'children' => $this->cat_recursion_next($child),
            ]);
        }

        return $data;
    }

    private function cat_recursion_next($cats)
    {
        $data = [];

        foreach ($cats as $c) {
            $db = Category::where('parent', $c->id)->get();

            if ($db->count() > 0) {
                $child = [];

                foreach ($db as $d) {
                    array_push($child, (object)[
                        'id' => $d->id,
                        'enable' => $d->enable,
                        'level' => $d->level,
                        'title' => $d->title,
                    ]);
                }

                array_push($data, (object)[
                    'id' => $c->id,
                    'enable' => $c->enable,
                    'level' => $c->level,
                    'title' => $c->title,
                    'children' => self::cat_recursion($child),
                ]);
            } else {

                array_push($data, (object)[
                    'id' => $c->id,
                    'enable' => $c->enable,
                    'level' => $c->level,
                    'title' => $c->title,
                ]);
            }
        }

        return $data;
    }

    public function filter(Request $request)
    {
        $types = ['category_id', 'price', 'prop'];

        foreach($request->all() as $k=>$v) {
            if(!in_array($k, $types)) {

                return response([
                    'result' => 'Wrong filter type. You can only transfer: category_id, price, prop'
                ], 422);
            }
        }

        $rules = []; $condition = [];
        if($request->has('category_id')) {

            $rules['category_id'] = 'required|int';
            $condition[] = ['goods.category_id', '=', $request->category_id];
        }
        if($request->has('price')) {

            $rules['price'] = 'required|int';
            $condition[] = ['goods.price', 'LIKE',  $request->price.'%'];
        }
        if($request->has('prop')) {

            $rules['prop'] = 'required|string';
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {
            $get = Goods::where($condition)->get();

            if($request->has('prop')) {
                $props = GoodProperty::get_good($request->prop);

                $get = $get->merge($props);
            }

            return response([
                'result' => $get
            ], 200);
        }
    }

    public function slug(Request $request)
    {
        $rules = [
            'slug' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response($validator->errors(), 422);
        } else {

            return Goods::where('slug', $request->slug)->first();
        }
    }
}
