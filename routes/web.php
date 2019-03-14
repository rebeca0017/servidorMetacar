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



Route::get('/pruebas', 'PruebasController@get');

Route::post('/detalle_matriculas', 'DetalleMatriculasController@create');
Route::get('/detalle_matriculas', 'DetalleMatriculasController@get');
Route::get('/detalle_matriculas/malla', 'DetalleMatriculasController@getForMalla');

Route::get('/asignaturas', 'AsignaturasController@get');
Route::get('/asignaturas/{id}', 'AsignaturasController@getOne');

Route::get('/periodo_lectivos', 'PeriodoLectivosController@get');
Route::get('/periodo_lectivos/actual', 'PeriodoLectivosController@getActual');
Route::get('/periodo_lectivos/{id}', 'PeriodoLectivosController@getOne');

Route::get('/tipo_matriculas', 'TipoMatriculasController@get');
Route::get('/tipo_matriculas/{id}', 'TipoMatriculasController@getOne');

Route::get('/estudiantes', 'EstudiantesController@getOne');

Route::get('/matriculas/cupo', 'MatriculasController@getCupo');
Route::get('/matriculas/validate_cupo', 'MatriculasController@validateCupo');
Route::get('/matriculas/validate_cupos_carrera', 'MatriculasController@validateCuposCarrera');
Route::get('/matriculas/validate_cupos_periodo_academico', 'MatriculasController@validateCuposPeriodoAcademico');
Route::delete('/matriculas/cupo', 'MatriculasController@deleteCupo');
Route::get('/matriculas/carreras', 'MatriculasController@getMatriculasCarreras');
Route::get('/matriculas/periodo_academicos', 'MatriculasController@getMatriculasPeriodoAcademicos');
Route::get('/matriculas/cupos', 'MatriculasController@getCupos');
Route::get('/matriculas/en_proceso', 'MatriculasController@getCuposEnProceso');
Route::get('/matriculas/asignaturas', 'MatriculasController@getAsignaturasMalla');
Route::put('/matriculas/update_detalle_matricula', 'MatriculasController@updateDetalleMatricula');
Route::delete('/matriculas/delete_detalle_matricula', 'MatriculasController@deleteDetalleMatricula');

Route::get('/catalogos/paises', 'CatalogosController@getPaises');
Route::get('/catalogos/provincias', 'CatalogosController@getProvincias');
Route::get('/catalogos/cantones', 'CatalogosController@getCantones');
Route::get('/catalogos/carreras', 'CatalogosController@getCarreras');
Route::get('/catalogos/periodo_academicos', 'CatalogosController@getPeriodoAcademicos');
Route::get('/export', 'ExcelController@export');
//Route::get('/import', 'ExcelController@import');
Route::post('/import_cupos', 'ExcelController@importCupos');
Route::post('/import_matriculas', 'ExcelController@importMatriculas');
