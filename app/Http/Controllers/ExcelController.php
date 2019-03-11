<?php

namespace App\Http\Controllers;


use App\Asignatura;
use App\DetalleMatricula;
use App\Estudiante;
use App\Exports\UsersExport;
use App\Imports\UsersImport;
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
        return Excel::download(new UsersExport, 'users.xlsx');
    }

    public function import(Request $request)
    {
//        $archivo = file_get_contents($_FILES['archivo']['tmp_name']);

        if ($request->file('archivo')) {

            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '\\app\\' . $pathFile;

            //$path = Storage::disk('public')->put('archivos', $request->file('archivo'));
            // $post->fill(['file' => asset($path)])->save();
            Excel::load($path, function ($reader) {
                // $carrera = Carrera::where('codigo', $request->carrera_id)->first();
                foreach ($reader->get() as $row) {
                    $estudiante = Estudiante::where('identificacion', $row->identificacion)->first();
                    if (!$estudiante) {
                        $error = 'no hay estudiante';
                    } else {
                        $periodoLectivo = PeriodoLectivo::where('id', $row->periodo_lectivo_id)->first();
                        $existeMatricula = Matricula::where('estudiante_id', $estudiante->id)
                            ->where('periodo_lectivo_id', $periodoLectivo->id)->first();
                        if (!$existeMatricula) {
                            $matricula = new Matricula([
                                'codigo' => $row->codigo,
                                'codigo_sniese_paralelo' => $row->codigo_sniese_paralelo,
                                'folio' => $row->folio,
                                'fecha' => $row->fecha,
                                'jornada' => $row->jornada,
                                'paralelo_principal' => $row->paralelo_principal,
                                'estado' => 'EN_PROCESO'
                            ]);

                            $estudiante = Estudiante::where('id', $estudiante->id)->first();
                            $periodoAcademico = PeriodoAcademico::where('id', $row->periodo_academico_id)->first();
                            $malla = Malla::where('id', $row->malla_id)->first();
                            // $carrera = Carrera::where('codigo', $carrera)->first();
                            $matricula->estudiante()->associate($estudiante);
                            $matricula->periodo_lectivo()->associate($periodoLectivo);
                            $matricula->periodo_academico()->associate($periodoAcademico);
                            $matricula->periodo_academico()->associate($periodoAcademico);
                            $matricula->malla()->associate($malla);
                            $matricula->save();
                        } else {
                            $matricula = $existeMatricula;
                        }
                        $asignatura = Asignatura::where('codigo', $row->asignatura_codigo)->first();
                        if (!$asignatura) {
                            $error = 'no hay asignatura';
                        } else {
                            $existeAsignatura = DetalleMatricula::where('asignatura_id', $asignatura->id)
                                ->where('matricula_id', $matricula->id)->first();
                            if (!$existeAsignatura) {
                                $detalleMatriculas = new DetalleMatricula([
                                    'paralelo' => $row->paralelo,
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
