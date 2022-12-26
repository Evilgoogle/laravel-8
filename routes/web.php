<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [MainController::class, 'index'])->name('index');
Route::get('/goods', [MainController::class, 'goods'])->name('goods');

Route::group(['prefix' => 'cart'], function () {
    Route::get('', [CartController::class, 'index'])->name('cart');
    Route::post('to-cart', [CartController::class, 'addToCart']);
    Route::post('remove', [CartController::class, 'remove']);
    Route::post('action', [CartController::class, 'cartAction']);
    Route::get('clear', [CartController::class, 'cartClear']);
});

Route::group(['prefix' => 'order'], function () {
    Route::get('', [OrderController::class, 'index']);
    Route::post('order', [OrderController::class, 'order']);
});

/*Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});*/
