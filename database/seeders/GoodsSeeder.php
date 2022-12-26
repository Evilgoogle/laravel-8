<?php

namespace Database\Seeders;

use App\Models\GoodProperty;
use App\Models\Goods;
use Illuminate\Database\Eloquent\Factories\Sequence;
use Illuminate\Database\Seeder;

class GoodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $good = Goods::factory(70)
            ->has(
                GoodProperty::factory()
                    ->state(function (array $attributes, Goods $good) {
                        return [
                            'good_id' => $good->id,
                        ];
                    })
                    ->state(new Sequence(
                        ['title' => 'length'],
                        ['title' => 'width'],
                        ['title' => 'weight'],
                        ['title' => 'color'],
                    ))
                    ->count(4),
      'properties'
            )
            ->create();
    }
}
