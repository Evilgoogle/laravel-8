<?php

namespace Database\Factories;

use App\Models\GoodProperty;
use Illuminate\Database\Eloquent\Factories\Factory;

class GoodPropertyFactory extends Factory
{

    public function configure()
    {
        return $this->afterMaking(function (GoodProperty $item) {
            if($item->title == 'length') {

                $item->value = $this->faker->numberBetween(10, 40);
            } elseif ($item->title == 'width') {

                $item->value = $this->faker->numberBetween(15, 60);
            } elseif($item->title == 'weight') {

                $item->value = $this->faker->numberBetween(1, 6);
            } elseif($item->title == 'color') {

                $item->value = $this->faker->safeColorName();
            }
        });
    }
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            //
        ];
    }
}
