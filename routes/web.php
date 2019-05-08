<?php

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


use Illuminate\Support\Facades\Hash;

Route::get('/', function () {
    return Hash::make('12345678');
});
Route::get('/pruebas', 'PruebasController@get');
Route::get('/home', 'HomeController@index')->name('home')->middleware('auth');
Auth::routes();

Route::get('pdf', 'EstudiantesController@invoice');