<?php

Route::post('/cliente','ClienteController@crearCliente');
Route::delete('/cliente','ClienteController@eliminarCliente');
Route::get('/cliente','ClienteController@obtenerCliente');
Route::get('/cliente','ClienteController@obtenerClienteActivo');
Route::post('/cliente','ClienteController@actualizarCliente');

Route::post('/auto','AutoController@guardarAuto');
Route::delete('/cliente','AutoController@eliminarAuto');
Route::get('/cliente','AutoController@obtenerAuto');
Route::get('/cliente','AutoController@obtenerAutoActivo');
Route::post('/cliente','AutoController@actualizarAutoCliente');

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

Auth::routes();