<?php

use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\GoodsController;
use App\Http\Controllers\Api\BusketController;
use App\Http\Controllers\Api\OrderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::group(['middleware' => 'auth:sanctum'], function() {
    // User
    Route::group(['prefix' => 'user'], function () {
        Route::post('registration', [UserController::class, 'registration']);
    });

    // Category and Goods
    Route::group(['prefix' => 'goods'], function () {
        Route::post('cats', [GoodsController::class, 'cats']);
        Route::post('filter', [GoodsController::class, 'filter']);
        Route::get('slug', [GoodsController::class, 'slug']);
    });

    // Busket
    Route::group(['prefix' => 'busket'], function () {
        Route::post('add', [BusketController::class, 'add']);
        Route::put('update', [BusketController::class, 'update']);
        Route::delete('del', [BusketController::class, 'del']);
    });

    // Order
    Route::group(['prefix' => 'order'], function () {
        Route::post('add', [OrderController::class, 'add']);
        Route::post('show', [OrderController::class, 'show']);
    });
});

Route::get('login', [UserController::class, 'login']);
