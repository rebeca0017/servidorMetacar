<?php

namespace App\Http\Controllers;

use App\Carrera;
use Illuminate\Database\QueryException;
use Excel;
use App\InformacionEstudiante;
use App\InformacionEstudianteTransaccion;
use Carbon\Carbon;
use App\Asignatura;
use App\DetalleMatricula;
use App\DetalleMatriculaTransaccion;
use App\Estudiante;
use Illuminate\Support\Facades\DB;
use App\Matricula;
use App\MatriculaTransaccion;
use App\PeriodoAcademico;
use App\PeriodoLectivo;
use App\Malla;
use App\TipoMatricula;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ExcelController extends Controller
{
    public function exportErroresCupos(Request $request)
    {
        Excel::create('Errores Cupos', function ($excel) use (&$request) {
            $excel->sheet('Errores', function ($sheet) use (&$request) {
                $sheet->fromArray($request->errores);
            });
        })->download('xlsx');
    }

    public function exportCuposCarrera(Request $request)
    {
        $now = Carbon::now();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $carrera = Carrera::findOrFail($request->carrera_id);
        $cupos = Matricula::select(
            'carreras.nombre as carrera',
            'carreras.descripcion as malla',
            'estudiantes.identificacion as cedula_estudiante',
            'estudiantes.apellido1',
            'estudiantes.apellido2',
            'estudiantes.nombre1',
            'estudiantes.nombre2',
            'asignaturas.codigo as codigo_asignatura',
            'asignaturas.nombre as asignatura',
            'detalle_matriculas.jornada as jornada_asignatura',
            'detalle_matriculas.paralelo as paralelo_asignatura',
            'detalle_matriculas.numero_matricula as numero_matricula',
            'tipo_matriculas.nombre as tipo_matricula',
            'matriculas.paralelo_principal as paralelo_principal',
            'matriculas.jornada as jornada_principal',
            'matriculas.periodo_academico_id as periodo_academico_principal',
            'matriculas.estado'
        )
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', '=', 'detalle_matriculas.tipo_matricula_id')
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderBy('matriculas.periodo_academico_id')
            ->orderBy('estudiantes.apellido1')
            ->get();

        Excel::create('Cupos_' . $carrera->siglas . '_' . $now->format('Y-m-d H:i:s'),
            function ($excel) use (&$cupos) {
                $excel->sheet('Cupos', function ($sheet) use (&$request, &$cupos) {
                    $sheet->fromArray($cupos);
                });
            })->download('xlsx');
    }

    public function exportCuposPeriodoAcademico(Request $request)
    {
        $now = Carbon::now();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $carrera = Carrera::findOrFail($request->carrera_id);
        $cupos = Matricula::select(
            'carreras.nombre as carrera',
            'carreras.descripcion as malla',
            'estudiantes.identificacion',
            'estudiantes.apellido1',
            'estudiantes.apellido2',
            'estudiantes.nombre1',
            'estudiantes.nombre2',
            'asignaturas.codigo',
            'asignaturas.nombre as asignatura',
            'asignaturas.periodo_academico_id as periodo_academico',
            'matriculas.estado'
        )
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->where('matriculas.periodo_academico_id', $request->periodo_academico_id)
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderby('estudiantes.apellido1')
            ->get();

        Excel::create($request->periodo_academico_id . '_' . 'Cupos_' . $carrera->siglas . '_' . $now->format('Y-m-d H:i:s'),
            function ($excel) use (&$cupos) {
                $excel->sheet('Cupos', function ($sheet) use (&$request, &$cupos) {
                    $sheet->fromArray($cupos);
                });
            })->download('xlsx');
    }

    public function importMatriculas(Request $request)
    {
        if ($request->file('archivo')) {

            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '\\app\\' . $pathFile;

            Excel::load($path, function ($reader) {
                try {
                    foreach ($reader->get() as $row) {
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('id', $row->estudiante_id)->first();
                        if ($estudiante) {
                            $periodoLectivo = PeriodoLectivo::findOrFail($row->periodo_lectivo_id);
                            $existeMatricula = Matricula::where('estudiante_id', $estudiante->id)
                                ->where('periodo_lectivo_id', $periodoLectivo->id)->first();
                            if (!$existeMatricula) {
                                $matricula = new Matricula([
                                    'codigo' => strtoupper($row->codigo_matricula),
                                    'folio' => strtoupper($row->folio),
                                    'fecha' => $row->fecha,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'MATRICULADO'
                                ]);
                                $matriculaAnterior = Matricula::where('estudiante_id', $estudiante->id)
                                    ->where('estado', 'MATRICULADO')
                                    ->orderby('fecha', 'DESC')->first();
                                $periodoAcademico = PeriodoAcademico::where('id', $row->periodo_academico_principal)->first();
                                $malla = Malla::where('id', $row->malla_id)->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->save();
                                if ($matriculaAnterior) {
                                    $informacionEstudiante = InformacionEstudiante::
                                    where('matricula_id', $matriculaAnterior->id)->first();

                                    $matricula->informacion_estudiantes()->create([
                                        'ha_repetido_asignatura' => $informacionEstudiante->ha_repetido_asignatura,
                                        'ha_perdido_gratuidad' => $informacionEstudiante->ha_perdido_gratuidad,
                                        'ha_realizado_practicas' => $informacionEstudiante->ha_realizado_practicas,
                                        'horas_practicas' => $informacionEstudiante->horas_practicas,
                                        'sector_economico_practica' => $informacionEstudiante->sector_economico_practica,
                                        'tipo_institucion_practicas' => $informacionEstudiante->tipo_institucion_practicas,
                                        'ha_realizado_vinculacion' => $informacionEstudiante->ha_realizado_vinculacion,
                                        'c' => $informacionEstudiante->alcance_vinculacion,
                                        'alcance_vinculacion' => $informacionEstudiante->alcance_vinculacion,
                                        'ocupacion' => $informacionEstudiante->ocupacion,
                                        'nombre_empresa_labora' => $informacionEstudiante->nombre_empresa_labora,
                                        'area_trabajo_empresa' => $informacionEstudiante->area_trabajo_empresa,
                                        'destino_ingreso' => $informacionEstudiante->destino_ingreso,
                                        'recibe_bono_desarrollo' => $informacionEstudiante->recibe_bono_desarrollo,
                                        'nivel_formacion_padre' => $informacionEstudiante->nivel_formacion_padre,
                                        'nivel_formacion_madre' => $informacionEstudiante->nivel_formacion_madre,
                                        'ingreso_familiar' => $informacionEstudiante->ingreso_familiar,
                                        'numero_miembros_hogar' => $informacionEstudiante->numero_miembros_hogar,
                                        'tiene_carnet_conadis' => $informacionEstudiante->tiene_carnet_conadis,
                                        'numero_carnet_conadis' => $informacionEstudiante->numero_carnet_conadis,
                                        'tipo_discapcidad' => $informacionEstudiante->tipo_discapcidad,
                                        'porcentaje_discapacidad' => $informacionEstudiante->porcentaje_discapacidad,
                                        'telefono_fijo' => $informacionEstudiante->telefono_fijo,
                                        'telefono_celular' => $informacionEstudiante->telefono_celular,
                                        'direccion' => $informacionEstudiante->direccion,
                                        'estado_civil' => $informacionEstudiante->estado_civil,
                                        'pension_diferenciada' => $informacionEstudiante->pension_diferenciada,
                                        'tipo_beca' => $informacionEstudiante->tipo_beca,
                                        'razon_beca' => $informacionEstudiante->razon_beca,
                                        'monto_beca' => $informacionEstudiante->monto_beca,
                                        'porciento_beca_cobertura_arancel' => $informacionEstudiante->porciento_beca_cobertura_arancel,
                                        'porciento_beca_cobertura_manutencion' => $informacionEstudiante->porciento_beca_cobertura_manutencion,
                                        'tipo_financiamiento_beca' => $informacionEstudiante->tipo_financiamiento_beca,
                                        'monto_ayuda_economica' => $informacionEstudiante->monto_ayuda_economica,
                                        'monto_credito_educativo' => $informacionEstudiante->monto_credito_educativo
                                    ]);
                                } else {
                                    $matricula->informacion_estudiantes()->create();
                                }

                            } else {
                                $matricula = $existeMatricula;
                                $matricula->update([
                                    'codigo' => strtoupper($row->codigo_matricula),
                                    'folio' => strtoupper($row->folio),
                                    'fecha' => $row->fecha,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal)
                                ]);
                            }
                            $asignatura = Asignatura::where('codigo', $row->codigo_asignatura)->first();
                            if ($asignatura) {
                                $existeAsignatura = DetalleMatricula::where('asignatura_id', $asignatura->id)
                                    ->where('matricula_id', $matricula->id)->first();
                                if (!$existeAsignatura) {
                                    $detalleMatriculas = new DetalleMatricula([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura),
                                        'estado' => 'MATRICULADO'
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('id', $row->tipo_matricula_id)->first();
                                    $detalleMatriculas->matricula()->associate($matricula);
                                    $detalleMatriculas->asignatura()->associate($asignatura);
                                    $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                    $detalleMatriculas->save();
                                }
                            }

                        }
                        DB::commit();
                    }
                } catch (\Exception $e) {
                    return 'error';
                }
            });
            $cupos = Matricula::get();
            Storage::delete($pathFile);
            return response()->json(['cupos' => $cupos], 200);

        } else {
            return "false";
        }

    }

    public function importCupos(Request $request)
    {
        if ($request->file('archivo')) {
            $errors = array();
            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '/app/' . $pathFile;
            $i = 0;
            $countEstudiantes = 0;
            $countAsignaturas = 0;
            $countAsignaturasModificadas = 0;
            $response = Excel::load($path, function ($reader)
            use (&$request, &$errors, &$i, &$countEstudiantes, &$countAsignaturas, &$countAsignaturasModificadas) {
                $now = Carbon::now();
                $identificacion = '';
                $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
                $malla = Malla::where('carrera_id', $request->carrera_id)->first();
                foreach ($reader->get() as $row) {
                    try {
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('identificacion', $row->cedula_estudiante)->first();
                        $asignatura = Asignatura::where('codigo', strtoupper($row->codigo_asignatura))
                            ->where('malla_id', $malla->id)
                            ->first();
                        if ($estudiante && $asignatura) {
                            $existeMatricula = MatriculaTransaccion::where('estudiante_id', $estudiante->id)
                                ->where('periodo_lectivo_id', $periodoLectivo->id)
                                ->first();
                            if (!$existeMatricula) {
                                $identificacion = $row->cedula_estudiante;
                                $countEstudiantes++;
                                $matriculaAnterior = MatriculaTransaccion::where('estudiante_id', $estudiante->id)
                                    ->where('estado', 'MATRICULADO')
                                    ->orderby('fecha', 'DESC')->first();

                                $matricula = new MatriculaTransaccion([
                                    'fecha' => $now,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $periodoAcademico = PeriodoAcademico::where('id', strtoupper($row->periodo_academico_principal))
                                    ->first();

                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->save();

                                if ($matriculaAnterior) {
                                    $informacionEstudiante = InformacionEstudianteTransaccion::
                                    where('matricula_id', $matriculaAnterior->id)->first();
                                    $matricula->informacion_estudiantes()->create([
                                        'ha_repetido_asignatura' => $informacionEstudiante->ha_repetido_asignatura,
                                        'ha_perdido_gratuidad' => $informacionEstudiante->ha_perdido_gratuidad,
                                        'ha_realizado_practicas' => $informacionEstudiante->ha_realizado_practicas,
                                        'horas_practicas' => $informacionEstudiante->horas_practicas,
                                        'sector_economico_practica' => $informacionEstudiante->sector_economico_practica,
                                        'tipo_institucion_practicas' => $informacionEstudiante->tipo_institucion_practicas,
                                        'ha_realizado_vinculacion' => $informacionEstudiante->ha_realizado_vinculacion,
                                        'alcance_vinculacion' => $informacionEstudiante->alcance_vinculacion,
                                        'ocupacion' => $informacionEstudiante->ocupacion,
                                        'nombre_empresa_labora' => $informacionEstudiante->nombre_empresa_labora,
                                        'area_trabajo_empresa' => $informacionEstudiante->area_trabajo_empresa,
                                        'destino_ingreso' => $informacionEstudiante->destino_ingreso,
                                        'recibe_bono_desarrollo' => $informacionEstudiante->recibe_bono_desarrollo,
                                        'nivel_formacion_padre' => $informacionEstudiante->nivel_formacion_padre,
                                        'nivel_formacion_madre' => $informacionEstudiante->nivel_formacion_madre,
                                        'ingreso_familiar' => $informacionEstudiante->ingreso_familiar,
                                        'numero_miembros_hogar' => $informacionEstudiante->numero_miembros_hogar,
                                        'tiene_carnet_conadis' => $informacionEstudiante->tiene_carnet_conadis,
                                        'numero_carnet_conadis' => $informacionEstudiante->numero_carnet_conadis,
                                        'tipo_discapcidad' => $informacionEstudiante->tipo_discapcidad,
                                        'porcentaje_discapacidad' => $informacionEstudiante->porcentaje_discapacidad,
                                        'telefono_fijo' => $informacionEstudiante->telefono_fijo,
                                        'telefono_celular' => $informacionEstudiante->telefono_celular,
                                        'direccion' => $informacionEstudiante->direccion,
                                        'estado_civil' => $informacionEstudiante->estado_civil,
                                        'pension_diferenciada' => $informacionEstudiante->pension_diferenciada,
                                        'tipo_beca' => $informacionEstudiante->tipo_beca,
                                        'razon_beca' => $informacionEstudiante->razon_beca,
                                        'monto_beca' => $informacionEstudiante->monto_beca,
                                        'porciento_beca_cobertura_arancel' => $informacionEstudiante->porciento_beca_cobertura_arancel,
                                        'porciento_beca_cobertura_manutencion' => $informacionEstudiante->porciento_beca_cobertura_manutencion,
                                        'tipo_financiamiento_beca' => $informacionEstudiante->tipo_financiamiento_beca,
                                        'monto_ayuda_economica' => $informacionEstudiante->monto_ayuda_economica,
                                        'monto_credito_educativo' => $informacionEstudiante->monto_credito_educativo
                                    ]);
                                } else {
                                    $matricula->informacion_estudiantes()->create();
                                }

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $countAsignaturas++;
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            } else if (!($existeMatricula->estado == 'MATRICULADO'
                                || $existeMatricula->estado == 'APROBADO')) {

                                if ($identificacion != $row->cedula_estudiante) {
                                    $identificacion = $row->cedula_estudiante;
                                    $existeMatricula->update([
                                        'fecha' => $now,
                                        'jornada' => $this->changeJornada($row->jornada_principal),
                                        'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                        'estado' => 'EN_PROCESO'
                                    ]);
                                    $periodoAcademico = PeriodoAcademico::where('id', $row->periodo_academico_principal)->first();
                                    $existeMatricula->estudiante()->associate($estudiante);
                                    $existeMatricula->periodo_lectivo()->associate($periodoLectivo);
                                    $existeMatricula->periodo_academico()->associate($periodoAcademico);
                                    $existeMatricula->malla()->associate($malla);
                                    $existeMatricula->save();
                                }


                                $existeDetalleMatricula = DetalleMatriculaTransaccion::where('asignatura_id', $asignatura->id)
                                    ->where('matricula_id', $existeMatricula->id)->first();

                                if ($existeDetalleMatricula) {
                                    $countAsignaturasModificadas++;
                                    $existeDetalleMatricula->update([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura)
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula))
                                        ->first();
                                    $existeDetalleMatricula->matricula()->associate($existeMatricula);
                                    $existeDetalleMatricula->asignatura()->associate($asignatura);
                                    $existeDetalleMatricula->tipo_matricula()->associate($tipoMatricula);
                                    $existeDetalleMatricula->save();
                                } else {
                                    $countAsignaturas++;
                                    $detalleMatriculas = new DetalleMatriculaTransaccion([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura),
                                        'estado' => 'EN_PROCESO'
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula))
                                        ->first();
                                    $detalleMatriculas->matricula()->associate($existeMatricula);
                                    $detalleMatriculas->asignatura()->associate($asignatura);
                                    $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                    $detalleMatriculas->save();
                                }

                            }
                        } else {
                            if (!$estudiante) {
                                $errors['cedulas_estudiante'][] = 'cedula_estudiante: ' . $row->cedula_estudiante . ' - fila: ' . ($i + 1);
                            }
                            if (!$asignatura) {
                                $errors['asignaturas'][] = 'codigo_asignatura: ' . $row->codigo_asignatura . ' - fila: ' . ($i + 1);
                            }
                        }
                        $i++;
                        DB::commit();
                    } catch (QueryException $e) {
                        return $e;
                    }
                }
            });
            Storage::delete($pathFile);
//            return response()->json(['respuesta' => $response]);

            return response()->json([
                'errores' => $errors,
                'registros' => $i,
                'total_estudiantes' => $countEstudiantes,
                'total_asignaturas' => $countAsignaturas,
                'total_asignaturas_modificadas' => $countAsignaturasModificadas
            ], 200);
        } else {
            return response()->json([
                'errores' => 'Archivo no valido',
                'registros' => 0,
                'total_estudiantes' => 0,
                'total_asignaturas' => 0
            ], 500);
        }

    }

    public function importEstudiantes(Request $request)
    {
        if ($request->file('archivo')) {
            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '/app/' . $pathFile;

            $countEstudiantes = 0;

            $response = Excel::load($path, function ($reader)
            use (&$request, &$countEstudiantes) {

                foreach ($reader->get() as $row) {
                    try {
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('identificacion', $row->cedula_estudiante)->first();

                        if ($estudiante) {
                            $countEstudiantes++;
                            $estudiante->update([
                                'nombre1' => strtoupper($row->nombre1),
                                'nombre2' => strtoupper($row->nombre2),
                                'apellido1' => strtoupper($row->apellido1),
                                'apellido2' => strtoupper($row->apellido2)
                            ]);
                        } else {
                            $estudiante->create([
                                'nombre1' => strtoupper($row->nombre1),
                                'nombre2' => strtoupper($row->nombre2),
                                'apellido1' => strtoupper($row->apellido1),
                                'apellido2' => strtoupper($row->apellido2)
                            ]);
                        }
                        DB::commit();
                    } catch (QueryException $e) {
                        return $e;
                    }
                }
            });
            Storage::delete($pathFile);
//            return response()->json(['respuesta' => $response]);

            return response()->json(['total_estudiantes' => $countEstudiantes], 200);
        } else {
            return response()->json([
                'errores' => 'Archivo no valido',
                'registros' => 0,
                'total_estudiantes' => 0,
                'total_asignaturas' => 0
            ], 500);
        }

    }

    public function prueba()
    {
        $now = Carbon::now();
        $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        if ($now->format('Y-m-d') >= $periodoLectivo->fecha_inicio_cupo
            && $now->format('Y-m-d') <= $periodoLectivo->fecha_fin_cupo) {
            return 1;
            $tipoMatricula = TipoMatricula::where('nombre', 'CUPO')->first();
        } else if ($now->format('Y-m-d') >= $periodoLectivo->fecha_inicio_ordinaria
            && $now->format('Y-m-d') <= $periodoLectivo->fecha_fin_ordinaria) {
            return 2;
            $tipoMatricula = TipoMatricula::where('nombre', 'ORDINARIA')->first();
        } else if ($now->format('Y-m-d') >= $periodoLectivo->fecha_inicio_extraordinaria
            && $now->format('Y-m-d') <= $periodoLectivo->fecha_fin_extraordinaria) {
            return 3;
            $tipoMatricula = TipoMatricula::where('nombre', 'EXTRAORDINARIA')->first();
        } else if ($now->format('Y-m-d') >= $periodoLectivo->fecha_inicio_extraordinaria
            && $now->format('Y-m-d') <= $periodoLectivo->fecha_fin_extraordinaria) {
            return 4;
            $tipoMatricula = TipoMatricula::where('nombre', 'ESPECIAL')->first();
        } else {
            return 5;
            $tipoMatricula = TipoMatricula::where('nombre', 'NA')->first();
        }

        return $tipoMatricula;
    }

    private function changeJornada($jornada)
    {
        $jornada = strtoupper(trim($jornada));
        $jornadas = array("MATUTINA", "VESPERTINA", "NOCTURNA", "INTENSIVA", "POR_DETERMINAR");
        $indice = array_search($jornada, $jornadas, false);
        if ($indice >= 0) {
            return $indice + 1;
        } else {
            return '';
        }
    }

    private function changeNumeroMatricula($numeroMatricula)
    {
        $numeroMatricula = strtoupper(trim($numeroMatricula));
        $numerosMatricula = array('PRIMERA', 'SEGUNDA', 'TERCERA');
        $indice = array_search($numeroMatricula, $numerosMatricula, false);
        if ($indice >= 0) {
            return $indice + 1;
        } else {
            return '';
        }
    }

    private function changeParalelo($paralelo)
    {
        $paralelo = strtoupper($paralelo);
        $paralelos = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T');
        $indice = array_search($paralelo, $paralelos, false);
        if ($indice >= 0) {
            return $indice + 1;
        } else {
            return '';
        }
    }

}
