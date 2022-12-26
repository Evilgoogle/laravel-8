<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class GoodsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $title = $this->faker->sentence(3);

        return [
            'category_id' => Category::get()->random()->id,
            'title' => $title,
            'slug' => Str::slug($title, '-'),
            'desc' => $this->faker->text(),
            'price' => $this->faker->randomFloat(2),
        ];
    }
}
