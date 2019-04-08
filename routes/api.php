<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/detalle_matriculas', 'DetalleMatriculasController@create')->middleware('auth:api');
Route::put('/detalle_matriculas', 'DetalleMatriculasController@update')->middleware('auth:api');
Route::get('/detalle_matriculas', 'DetalleMatriculasController@get')->middleware('auth:api');
Route::get('/detalle_matriculas/count', 'DetalleMatriculasController@getCountDetalleCuposCarrera')->middleware('auth:api');

Route::get('/asignaturas', 'AsignaturasController@get')->middleware('auth:api');
Route::get('/asignaturas/{id}', 'AsignaturasController@getOne')->middleware('auth:api');

Route::get('/periodo_lectivos', 'PeriodoLectivosController@get')->middleware('auth:api');
Route::get('/periodo_lectivos/actual', 'PeriodoLectivosController@getActual')->middleware('auth:api');
Route::get('/periodo_lectivos/{id}', 'PeriodoLectivosController@getOne')->middleware('auth:api');

Route::get('/tipo_matriculas', 'TipoMatriculasController@get')->middleware('auth:api');
Route::get('/tipo_matriculas/{id}', 'TipoMatriculasController@getOne')->middleware('auth:api');
Route::put('/estudiantes/update_perfil', 'EstudiantesController@updatePerfil')->middleware('auth:api');
Route::get('/estudiantes/en_proceso', 'EstudiantesController@getEnProceso')->middleware('auth:api');

Route::get('/matriculas/cupo', 'MatriculasController@getCupo')->middleware('auth:api');
Route::get('/matriculas/aprobado', 'MatriculasController@getAprobado')->middleware('auth:api');
Route::delete('/matriculas/cupo', 'MatriculasController@deleteCupo')->middleware('auth:api');
Route::delete('/matriculas/matricula', 'MatriculasController@deleteMatricula')->middleware('auth:api');
Route::get('/matriculas/validate_cupo', 'MatriculasController@validateCupo')->middleware('auth:api');
Route::get('/matriculas/validate_cupos_carrera', 'MatriculasController@validateCuposCarrera')->middleware('auth:api');
Route::get('/matriculas/validate_cupos_periodo_academico', 'MatriculasController@validateCuposPeriodoAcademico')->middleware('auth:api');

Route::delete('/matriculas/delete_cupos_carrera', 'MatriculasController@deleteCuposCarrera')->middleware('auth:api');
Route::delete('/matriculas/delete_cupos_periodo_academico', 'MatriculasController@deleteCuposPeriodo')->middleware('auth:api');
Route::get('/matriculas/certificado_matricula', 'MatriculasController@getCertificadoMatricula')->middleware('auth:api');
Route::get('/matriculas/carreras', 'MatriculasController@getMatriculasCarreras')->middleware('auth:api');
Route::get('/matriculas/periodo_academicos', 'MatriculasController@getMatriculasPeriodoAcademicos')->middleware('auth:api');
Route::get('/matriculas/cupos', 'MatriculasController@getCupos')->middleware('auth:api');
Route::get('/matriculas/aprobados', 'MatriculasController@getAprobados')->middleware('auth:api');
Route::get('/matriculas/en_proceso', 'MatriculasController@getCuposEnProceso')->middleware('auth:api');
Route::get('/matriculas/asignaturas', 'MatriculasController@getAsignaturasMalla')->middleware('auth:api');
Route::put('/matriculas', 'MatriculasController@updateMatricula')->middleware('auth:api');
Route::get('/matriculas/count', 'MatriculasController@getCountMatriculas')->middleware('auth:api');
Route::delete('/matriculas/delete_detalle_cupo', 'MatriculasController@deleteDetalleCupo')->middleware('auth:api');
Route::delete('/matriculas/delete_detalle_matricula', 'MatriculasController@deleteDetalleMatricula')->middleware('auth:api');

Route::get('/catalogos/paises', 'CatalogosController@getPaises')->middleware('auth:api');
Route::get('/catalogos/provincias', 'CatalogosController@getProvincias')->middleware('auth:api');
Route::get('/catalogos/cantones', 'CatalogosController@getCantones')->middleware('auth:api');
Route::get('/catalogos/carreras', 'CatalogosController@getCarreras')->middleware('auth:api');
Route::get('/catalogos/periodo_academicos', 'CatalogosController@getPeriodoAcademicos')->middleware('auth:api');
Route::get('/exports/cupos_carrera', 'ExcelController@exportCuposCarrera')->middleware('auth:api');
Route::get('/exports/cupos_periodo_academico', 'ExcelController@exportCuposPeriodoAcademico')->middleware('auth:api');

Route::post('/imports/cupos', 'ExcelController@importCupos')->middleware('auth:api');
Route::post('/imports/estudiantes', 'ExcelController@importEstudiantes')->middleware('auth:api');
Route::post('/imports/matriculas', 'ExcelController@importMatriculas')->middleware('auth:api');

Route::get('/certificado-matricula/{matricula_id}', 'MatriculasController@getCertificadoMatriculaPublic')->middleware('auth:api');
Route::get('/prueba', 'ExcelController@prueba')->middleware('auth:api');
Route::get('/exports/errores_cupos', 'ExcelController@exportErroresCupos')->middleware('auth:api');

Route::get('/email', 'PruebasController@email')->middleware('auth:api');
Route::post('/emails', 'EmailsController@send')->middleware('auth:api');

Route::get('/paralelos', 'ExcelController@changeParalelo')->middleware('auth:api');
Route::get('/users', 'UsersController@getOne')->middleware('auth:api');

