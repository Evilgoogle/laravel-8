<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Goods extends Model
{
    use HasFactory;

    public function properties()
    {
        return $this->hasMany(GoodProperty::class, 'good_id', 'id');
    }
}
