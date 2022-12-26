<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $level_1 = Category::factory(10)->create();
        foreach ($level_1 as $item_1) {
            $item_1->level = 1;
            $item_1->save();

            $level_2 = Category::factory(random_int(1, 5))->create();
            foreach ($level_2 as $item_2) {
                $item_2->parent = $item_1->id;
                $item_2->level = 2;
                $item_2->save();

                $level_3 = Category::factory(random_int(1, 3))->create();
                foreach ($level_3 as $item_3) {
                    $item_3->parent = $item_2->id;
                    $item_3->level = 3;
                    $item_3->save();
                }
            }
        }
    }
}
