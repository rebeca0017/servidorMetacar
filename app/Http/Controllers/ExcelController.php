<?php

namespace App\Http\Controllers;

use App\InformacionEstudiante;
use Carbon\Carbon;
use App\Asignatura;
use App\DetalleMatricula;
use App\Estudiante;
use App\Exports\UsersExport;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use App\Matricula;
use App\PeriodoAcademico;
use App\PeriodoLectivo;
use App\Malla;
use App\TipoMatricula;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;

class ExcelController extends Controller
{
    public function export()
    {
        Excel::create('Laravel Excel', function ($excel) {

            $excel->sheet('Productos', function ($sheet) {

                $products = Malla::all();

                $sheet->fromArray($products);

            });
        })->download('xls');
    }

    public function importCupos(Request $request)
    {
//        $archivo = file_get_contents($_FILES['archivo']['tmp_name']);

        if ($request->file('archivo')) {

            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '\\app\\' . $pathFile;

            //$path = Storage::disk('public')->put('archivos', $request->file('archivo'));
            // $post->fill(['file' => asset($path)])->save();

            Excel::load($path, function ($reader) {
                $now = Carbon::now();
                foreach ($reader->get() as $row) {
                    DB::beginTransaction();
                    $estudiante = Estudiante::where('identificacion', $row->cedula_estudiante)->first();
                    if ($estudiante) {
                        $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
                        $existeMatricula = Matricula::where('estudiante_id', $estudiante->id)
                            ->where('periodo_lectivo_id', $periodoLectivo->id)->first();
                        if (!$existeMatricula) {
                            $matriculaAnterior = Matricula::where('estudiante_id', $estudiante->id)
                                ->where('estado', 'MATRICULADO')
                                ->orderby('fecha', 'DESC')->first();
                            $matricula = new Matricula([
                                'codigo' => $now->format('Y-M-') . $estudiante->identificacion,
                                'fecha' => $now,
                                'jornada' => $row->jornada_principal,
                                'paralelo_principal' => $row->paralelo_principal,
                                'estado' => 'EN_PROCESO'
                            ]);
                            $periodoAcademico = PeriodoAcademico::where('id', $row->periodo_academico_id)->first();
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
                                'fecha' => $now,
                                'jornada' => $row->jornada_principal,
                                'paralelo_principal' => $row->paralelo_principal,
                                'estado' => 'EN_PROCESO'
                            ]);
                        }
                        $asignatura = Asignatura::where('codigo', $row->codigo_asignatura)->first();
                        if ($asignatura) {
                            $existeAsignatura = DetalleMatricula::where('asignatura_id', $asignatura->id)
                                ->where('matricula_id', $matricula->id)->first();
                            if (!$existeAsignatura) {
                                $detalleMatriculas = new DetalleMatricula([
                                    'paralelo' => $row->paralelo_asignatura,
                                    'numero_matricula' => $row->numero_matricula,
                                    'jornada' => $row->jornada_asignatura,
                                    'estado' => 'EN_PROCESO'
                                ]);
                                $tipoMatricula = TipoMatricula::where('nombre', $row->tipo_matricula)->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();
                            }
                        }

                    }
                    DB::commit();
                }
            });
            $cupos = Matricula::get();
            Storage::delete($pathFile);
            return response()->json(['cupos' => $cupos], 200);
        } else {
            return "false";
        }

    }

    public function importMatriculas(Request $request)
    {
        if ($request->file('archivo')) {

            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '\\app\\' . $pathFile;

            Excel::load($path, function ($reader) {
                foreach ($reader->get() as $row) {
                    DB::beginTransaction();
                    $estudiante = Estudiante::where('id', $row->estudiante_id)->first();
                    if ($estudiante) {
                        $periodoLectivo = PeriodoLectivo::findOrFail($row->periodo_lectivo_id);
                        $existeMatricula = Matricula::where('estudiante_id', $estudiante->id)
                            ->where('periodo_lectivo_id', $periodoLectivo->id)->first();
                        if (!$existeMatricula) {
                            $matricula = new Matricula([
                                'codigo' => $row->codigo_matricula,
                                'folio' => $row->folio,
                                'fecha' => $row->fecha,
                                'jornada' => $row->jornada_principal,
                                'paralelo_principal' => $row->paralelo_principal,
                                'estado' => 'MATRICULADO'
                            ]);
                            $matriculaAnterior = Matricula::where('estudiante_id', $estudiante->id)
                                ->where('estado', 'MATRICULADO')
                                ->orderby('fecha', 'DESC')->first();
                            $periodoAcademico = PeriodoAcademico::where('id', $row->periodo_academico_id)->first();
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
                                'codigo' => $row->codigo_matricula,
                                'folio' => $row->folio,
                                'fecha' => $row->fecha,
                                'jornada' => $row->jornada_principal,
                                'paralelo_principal' => $row->paralelo_principal,
                            ]);
                        }
                        $asignatura = Asignatura::where('codigo', $row->codigo_asignatura)->first();
                        if ($asignatura) {
                            $existeAsignatura = DetalleMatricula::where('asignatura_id', $asignatura->id)
                                ->where('matricula_id', $matricula->id)->first();
                            if (!$existeAsignatura) {
                                $detalleMatriculas = new DetalleMatricula([
                                    'paralelo' => $row->paralelo_asignatura,
                                    'numero_matricula' => $row->numero_matricula,
                                    'jornada' => $row->jornada_asignatura,
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
            });
            $cupos = Matricula::get();
            Storage::delete($pathFile);
            return response()->json(['cupos' => $cupos], 200);
        } else {
            return "false";
        }

    }

}
