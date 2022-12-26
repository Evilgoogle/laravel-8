<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TableGoods extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods', function (Blueprint $table) {
            $table->id();
            $table->boolean('enable')->default(true);
            $table->integer('category_id')->nullable();
            $table->integer('position')->nullable();
            $table->string('title')->nullable();
            $table->string('slug')->nullable();
            $table->text('desc')->nullable();
            $table->string('price')->nullable();
            $table->integer('discount')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods');
    }
}
