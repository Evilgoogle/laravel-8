<?php

namespace App\Http\Controllers\Tests;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MiddleController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth')->except('second');
        // без - на все методы
        // only
        // except
    }

    public function index()
    {
        dd('index');
    }

    public function second()
    {
        dd('second');
    }
}
