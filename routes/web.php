<?php

Route::post('/clientes','ClienteController@crearCliente');
Route::post('/clientes/vehiculos','ClienteController@registrarVehiculo');
Route::put('/clientes/vehiculos','ClienteController@actualizarVehiculo');
Route::get('/clientes/vehiculos','ClienteController@obtenerVehiculos');
Route::delete('/clientes','ClienteController@eliminarCliente');
Route::get('/clientes','ClienteController@obtenerCliente');
Route::get('/clientes/activo','ClienteController@obtenerClienteActivo');
Route::put('/clientes','ClienteController@actualizarCliente');

Route::post('/auto','AutoController@guardarAuto');
Route::delete('/auto','AutoController@eliminarAuto');
Route::get('/auto','AutoController@obtenerAuto');
Route::put('/auto','AutoController@actualizarAutoCliente');


Route::post('/servicios','serviciosController@crearServicio');
Route::delete('/servicios','serviciosController@eliminarServicio');
Route::post('/servicios','serviciosController@actualizarServicios');

Route::post('/mantenimiento','MantenimientoController@crearMantenimiento');
Route::delete('/mantenimiento','MantenimientoController@eliminarMantenimiento');
Route::post('/mantenimiento','MantenimientoController@actualizarmantenimiento');

Route::post('/usuarios/login','UsuarioController@login');
Route::post('/usuarios/clientes','UsuarioController@registrarCliente');

Route::get('/probar','UsuarioController@probar');
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
