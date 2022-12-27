<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GoodProperty extends Model
{
    use HasFactory;

    static public function get_good($prop)
    {
        return GoodProperty::select('g.*', 'good_properties.value')->where('good_properties.value', 'LIKE', $prop.'%')
            ->join('goods as g', 'g.id', '=', 'good_properties.good_id')
            ->get();
    }
}
