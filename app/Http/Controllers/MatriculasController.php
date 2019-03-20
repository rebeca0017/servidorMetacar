<?php

namespace App\Http\Controllers;

use App\Asignatura;
use App\DetalleMatricula;
use App\Estudiante;
use App\Malla;
use App\Carrera;
use App\Matricula;
use App\PeriodoAcademico;
use App\PeriodoLectivo;
use App\TipoMatricula;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class MatriculasController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getCountMatriculas(Request $request)
    {
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();

        $parameters = [$periodoLectivoActual->id, 'MATRICULADO', 'APROBADO'];
        $matriculadosCount = DB::select
        ('select carreras.id,carreras.nombre,matriculas.estado 
                from matriculas inner join mallas on matriculas.malla_id = mallas.id 
                inner join carreras on carreras.id = mallas.carrera_id
                where periodo_lectivo_id=? and (matriculas.estado=? or matriculas.estado=?)
                order by carreras.id'
            , $parameters);

        $carreras = DB::select
        ('select carreras.id,carreras.nombre,carreras.descripcion 
                from matriculas inner join mallas on matriculas.malla_id = mallas.id 
                inner join carreras on carreras.id = mallas.carrera_id
                where periodo_lectivo_id=? and (matriculas.estado=? or matriculas.estado=?)
                group by carreras.id'
            , $parameters);


        return response()->json(['matriculados_count' => $matriculadosCount,
            'carreras' => $carreras], 200);
    }

    public function getSolicitudMatricula(Request $request)
    {
        $certificadoMatricula = Matricula::select(
            'matriculas.*',
            'institutos.nombre as instituto',
            'carreras.nombre as carrera',
            'asignaturas.nombre as asignatura',
            'asignaturas.horas_docente as horas_docente',
            'asignaturas.horas_practica as horas_practica',
            'asignaturas.horas_autonoma as horas_autonoma',
            'asignaturas.codigo as asignatura_codigo',
            'asignaturas.periodo_academico_id as periodo'
        )
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('institutos', 'institutos.id', '=', 'carreras.instituto_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->where('matriculas.id', $request->matricula_id)
            ->get();

        return response()->json(['certificado' => $certificadoMatricula], 200);
    }

    public function getCertificadoMatricula(Request $request)
    {
        $certificadoMatricula = Matricula::select(
            'matriculas.*',
            'institutos.nombre as instituto',
            'carreras.nombre as carrera',
            'asignaturas.nombre as asignatura',
            'asignaturas.horas_docente as horas_docente',
            'asignaturas.horas_practica as horas_practica',
            'asignaturas.horas_autonoma as horas_autonoma',
            'asignaturas.codigo as asignatura_codigo',
            'asignaturas.periodo_academico_id as periodo',
            'detalle_matriculas.numero_matricula as numero_matricula'
        )
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('institutos', 'institutos.id', '=', 'carreras.instituto_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->where('matriculas.id', $request->matricula_id)
            ->get();

        return response()->json(['certificado' => $certificadoMatricula], 200);
    }

    public function getCertificadoMatriculaPublic(Request $request)
    {
        $certificadoMatricula = Matricula::select(
            'matriculas.*',
            'institutos.nombre as instituto',
            'carreras.nombre as carrera',
            'asignaturas.nombre as asignatura',
            'asignaturas.horas_docente as horas_docente',
            'asignaturas.horas_practica as horas_practica',
            'asignaturas.horas_autonoma as horas_autonoma',
            'asignaturas.codigo as asignatura_codigo',
            'asignaturas.periodo_academico_id as periodo',
            'detalle_matriculas.numero_matricula as numero_matricula'
        )
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('institutos', 'institutos.id', '=', 'carreras.instituto_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->where('matriculas.id', $request->matricula_id)
            ->get();

        return view('certificado-matricula', ['certificado' => $certificadoMatricula]);
        return $certificadoMatricula;
    }

    public function getAprobados(Request $request)
    {
        $carrera = Carrera::where('id', $request->carrera_id)->first();
        $malla = Malla::where('carrera_id', $carrera->id)->first();
        if ($request->periodo_academico_id) {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->with('estudiante')
                ->with('periodo_academico')
                ->with('periodo_lectivo')
                ->where(function ($cupos) use (&$malla, &$request) {
                    $cupos->where('malla_id', $malla->id)
                        ->where('periodo_lectivo_id', $request->periodo_lectivo_id)
                        ->where('periodo_academico_id', $request->periodo_academico_id);
                })
                ->where(function ($cupos) {
                    $cupos->orWhere('matriculas.estado', 'APROBADO')
                        ->orWhere('matriculas.estado', 'MATRICULADO')
                        ->orWhere('matriculas.estado', 'EN_PROCESO')
                        ->orWhere('matriculas.estado', 'ANULADO');
                })
                ->orderby('matriculas.estado', 'ASC')
                ->orderby('apellido1')
                ->orderby('apellido1')
                ->paginate($request->records_per_page);
        } else {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->with('estudiante')
                ->with('periodo_academico')
                ->with('periodo_lectivo')
                ->where(function ($cupos) use (&$malla, &$request) {
                    $cupos->where('malla_id', $malla->id)
                        ->where('periodo_lectivo_id', $request->periodo_lectivo_id);
                })
                ->where(function ($cupos) {
                    $cupos->where('matriculas.estado', 'APROBADO')
                        ->orWhere('matriculas.estado', 'MATRICULADO')
                        ->orWhere('matriculas.estado', 'EN_PROCESO')
                        ->orWhere('matriculas.estado', 'ANULADO');
                })
                ->orderby('matriculas.estado', 'ASC')
                ->orderby('apellido1')
                ->paginate($request->records_per_page);
        }

        return response()->json(['pagination' => [
            'total' => $cupos->total(),
            'current_page' => $cupos->currentPage(),
            'per_page' => $cupos->perPage(),
            'last_page' => $cupos->lastPage(),
            'from' => $cupos->firstItem(),
            'to' => $cupos->lastItem()
        ], 'cupos' => $cupos], 200);
    }

    public function getAprobado(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $cupo = Matricula::select('matriculas.*')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->orWhere(function ($cupo) use (&$request) {
                $cupo->orWhere('apellido1', 'like', '%' . $request->apellido1 . '%')
                    ->orWhere('apellido2', 'like', '%' . $request->apellido2 . '%')
                    ->orWhere('nombre1', 'like', '%' . $request->nombre1 . '%')
                    ->orWhere('nombre2', 'like', '%' . $request->nombre2 . '%')
                    ->orWhere('identificacion', 'like', '%' . $request->identificacion . '%');
            })
            ->where(function ($cupo) use (&$malla, &$periodoLectivoActual) {
                $cupo->where('matriculas.estado', '<>', 'EN_PROCESO')
                    ->where('matriculas.malla_id', '=', $malla->id)
                    ->where('matriculas.periodo_lectivo_id', '=', $periodoLectivoActual->id);
            })
            ->get();

        return response()->json(['cupo' => $cupo], 200);
    }

    public function getCupos(Request $request)
    {
        $carrera = Carrera::where('id', $request->carrera_id)->first();
        $malla = Malla::where('carrera_id', $carrera->id)->first();
        if ($request->periodo_academico_id) {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->with('estudiante')
                ->with('periodo_academico')
                ->with('periodo_lectivo')
                ->where(function ($cupos) use (&$malla, &$request) {
                    $cupos->where('malla_id', $malla->id)
                        ->where('periodo_lectivo_id', $request->periodo_lectivo_id)
                        ->where('periodo_academico_id', $request->periodo_academico_id);
                })
                ->where(function ($cupos) use (&$request) {
                    $cupos->orWhere('matriculas.estado', 'APROBADO')
                        ->orWhere('matriculas.estado', 'EN_PROCESO');
                })
                //->orderby('matriculas.estado', 'DESC')
                ->orderby('apellido1')
                ->paginate($request->records_per_page);
        } else {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->with('estudiante')
                ->with('periodo_academico')
                ->with('periodo_lectivo')
                ->where(function ($cupos) use (&$malla, &$request) {
                    $cupos->where('malla_id', $malla->id)
                        ->where('periodo_lectivo_id', $request->periodo_lectivo_id);
                })
                ->where(function ($cupos) {
                    $cupos->where('matriculas.estado', 'APROBADO')
                        ->orWhere('matriculas.estado', 'EN_PROCESO');
                })
                //->orderby('matriculas.estado', 'DESC')
                ->orderby('apellido1')
                ->paginate($request->records_per_page);
        }

        return response()->json(['pagination' => [
            'total' => $cupos->total(),
            'current_page' => $cupos->currentPage(),
            'per_page' => $cupos->perPage(),
            'last_page' => $cupos->lastPage(),
            'from' => $cupos->firstItem(),
            'to' => $cupos->lastItem()
        ], 'cupos' => $cupos], 200);
    }

    public function getCupo(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $cupo = Matricula::select('matriculas.*')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->orWhere(function ($cupo) use (&$request) {
                $cupo->orWhere('apellido1', 'like', '%' . $request->apellido1 . '%')
                    ->orWhere('apellido2', 'like', '%' . $request->apellido2 . '%')
                    ->orWhere('nombre1', 'like', '%' . $request->nombre1 . '%')
                    ->orWhere('nombre2', 'like', '%' . $request->nombre2 . '%')
                    ->orWhere('identificacion', 'like', '%' . $request->identificacion . '%');
            })
            ->where(function ($cupo) use (&$malla, &$periodoLectivoActual) {
                $cupo->where('matriculas.estado', '<>', 'MATRICULADO')
                    ->where('matriculas.malla_id', '=', $malla->id)
                    ->where('matriculas.periodo_lectivo_id', '=', $periodoLectivoActual->id);
            })
            ->get();

        return response()->json(['cupo' => $cupo], 200);
    }

    public function getAsignaturasMalla(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $asignaturas = Asignatura::where('malla_id', $malla->id)->with('periodo_academico')->get();
        return response()->json(['asignaturas' => $asignaturas], 200);
    }

    public function updateDetalleMatricula(Request $request)
    {
        try {
            $data = $request->json()->all();
            $dataDetalleMatricula = $data['detalle_matricula'];
            $detalleMatricula = DetalleMatricula::findOrFail($dataDetalleMatricula['id']);

            $detalleMatricula->update([
                'paralelo' => $dataDetalleMatricula['paralelo'],
                'jornada' => $dataDetalleMatricula['jornada'],
                'numero_matricula' => $dataDetalleMatricula['numero_matricula']
            ]);
            $asignatura = Asignatura::findOrFail($dataDetalleMatricula['asignatura']['id']);
            $tipoMatricula = TipoMatricula::findOrFail($dataDetalleMatricula['tipo_matricula']['id']);

            $detalleMatricula->asignatura()->associate($asignatura);
            $detalleMatricula->tipo_matricula()->associate($tipoMatricula);
            $detalleMatricula->save();
            $detalleMatricula->matricula()->update(['estado' => 'EN_PROCESO']);

            return response()->json(['detalle_matricula' => $detalleMatricula], 201);
        } catch (ModelNotFoundException $e) {
            return response()->json($e, 405);
        } catch (NotFoundHttpException  $e) {
            return response()->json($e, 405);
        } catch (\PDOException $e) {
            return response()->json($e, 409);
        } catch (QueryException $e) {
            return response()->json('asdasd', 200);
        } catch (Exception $e) {
            return response()->json($e, 500);
        } catch (Error $e) {
            return response()->json($e, 500);
        } catch (ErrorException $e) {
            return response()->json($e, 500);
        }
    }

    public function updateMatricula(Request $request)
    {
        try {
            $data = $request->json()->all();
            $dataMatricula = $data['matricula'];
            $matricula = Matricula::findOrFail($dataMatricula['id']);

            $matricula->update([
                'jornada' => $dataMatricula['jornada']
            ]);
            $periodoAcademico = PeriodoAcademico::findOrFail($dataMatricula['periodo_academico']['id']);

            $matricula->periodo_academico()->associate($periodoAcademico);
            $matricula->save();


            return response()->json(['matriculas' => $matricula], 201);
        } catch (ModelNotFoundException $e) {
            return response()->json($e, 405);
        } catch (NotFoundHttpException  $e) {
            return response()->json($e, 405);
        } catch (\PDOException $e) {
            return response()->json($e, 409);
        } catch (QueryException $e) {
            return response()->json('asdasd', 200);
        } catch (Exception $e) {
            return response()->json($e, 500);
        } catch (Error $e) {
            return response()->json($e, 500);
        } catch (ErrorException $e) {
            return response()->json($e, 500);
        }
    }

    public function deleteDetalleCupo(Request $request)
    {
        $detalleMatricula = DetalleMatricula::findOrFail($request->id)->delete();
        return response()->json(['detalle_matricula' => $detalleMatricula], 201);
    }

    public function deleteDetalleMatricula(Request $request)
    {
        $detalleMatricula = DetalleMatricula::findOrFail($request->id);
        $detalleMatricula->update(['estado' => 'ANULADO']);
        return response()->json(['detalle_matricula' => $detalleMatricula], 201);
    }

    public function getMatriculasCarreras(Request $request)
    {
        //$data = $request->json()->all();
        $sql = "SELECT * FROM mallas WHERE estado <> 'INACTIVO' AND carrera_id = " . $request->carrera_id;
        $malla = DB::select($sql);
        $sql = "SELECT * FROM matriculas WHERE estado <> 'INACTIVO' AND malla_id = " . $malla[0]->id;
        $matriculas = DB::select($sql);
        return response()->json(['matriculas' => $matriculas], 200);
    }

    public function getMatriculasPeriodoAcademicos(Request $request)
    {
        //$data = $request->json()->all();
        $sql = "SELECT * FROM mallas WHERE estado <> 'INACTIVO' AND carrera_id = " . $request->carrera_id;
        $malla = DB::select($sql);
        $sql = "SELECT * FROM matriculas WHERE estado <> 'INACTIVO' AND malla_id =" . $malla[0]->id .
            "AND periodo_academico_id =" . $request->periodo_academico_id;
        $matriculas = DB::select($sql);
        return response()->json(['matriculas' => $matriculas], 200);
    }

    public function update(Request $request)
    {
        $data = $request->json()->all();
        $dataEstudiante = $data['estudiante'];
        $dataInformacionEstudiante = $data['estudiante'];
        $parameters = [
            $dataEstudiante['pais_nacionalidad_id'],
            $dataEstudiante['pais_residencia_id'],
            $dataEstudiante['identificacion'],
            $dataEstudiante['nombre1'],
            $dataEstudiante['nombre2'],
            $dataEstudiante['apellido1'],
            $dataEstudiante['apellido2'],
            $dataEstudiante['fecha_nacimiento'],
            $dataEstudiante['correo_personal'],
            $dataEstudiante['correo_institucional'],
            $dataEstudiante['sexo'],
            $dataEstudiante['etnia'],
            $dataEstudiante['tipo_sangre'],
            $dataEstudiante['tipo_documento'],
            $dataEstudiante['tipo_colegio'],
        ];
        $sql = 'SELECT estudiantes.* 
                FROM 
                  matriculas inner join informacion_estudiantes on matriculas.id = informacion_estudiantes.matricula_id 
	              inner join estudiantes on matriculas.estudiante_id = estudiantes.id 
	            WHERE matriculas.periodo_lectivo_id = 1 and matriculas.estudiante_id =1';
        $estudiante = DB::select($sql, null);

        $sql = 'SELECT informacion_estudiantes.* 
                FROM 
                  matriculas inner join informacion_estudiantes on matriculas.id = informacion_estudiantes.matricula_id 
	              inner join estudiantes on matriculas.estudiante_id = estudiantes.id 
	            WHERE matriculas.periodo_lectivo_id = 1 and matriculas.estudiante_id =1';
        $informacionEstudiante = DB::select($sql, null);
        return response()->json([
            'estudiante' => $estudiante,
            'informacion_estudiante' => $informacionEstudiante
        ]);
    }

    public function deleteCupo(Request $request)
    {
        $matricula = Matricula::findOrFail($request->id)->delete();
        return response()->json(['detalle_matricula' => $matricula], 201);
    }

    public function deleteMatricula(Request $request)
    {
        $matricula = Matricula::findOrFail($request->id);
        $matricula->update(['estado' => 'ANULADO']);
        $matricula->detalle_matriculas()->update(['estado' => 'ANULADO']);

        return response()->json(['detalle_matricula' => $matricula], 201);
    }

    public function validateCupo(Request $request)
    {
        $now = new Carbon();
        //date('F', strtotime($matricula->fecha))
        $matricula = Matricula::findOrFail($request->matricula_id);
        $periodoLectivo = PeriodoLectivo::findOrFail($matricula->periodo_lectivo_id);
        $estudiante = Estudiante::findOrFail($matricula->estudiante_id);
        $malla = Malla::findOrFail($matricula->malla_id);
        $carrera = $malla->carrera()->first();
        if ($matricula && $request->estado == 'MATRICULADO') {
            $matricula->update([
                'fecha' => $now,
                'estado' => $request->estado,
                'codigo' => $periodoLectivo->codigo . '-' . $carrera->siglas . '-' . $estudiante->identificacion,
                'folio' => $periodoLectivo->codigo . '-' . $carrera->siglas
            ]);
            $matricula->detalle_matriculas()->update(['estado' => $request->estado]);
        } else {
            $matricula->update([
                'estado' => $request->estado,
                'fecha' => $now
            ]);
            $matricula->detalle_matriculas()->update(['estado' => $request->estado]);
        }
        return response()->json(['matricula' => $matricula], 201);
    }

    public function validateCuposCarrera(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $malla->matriculas()->update(['estado' => 'APROBADO']);
        $matriculas = $malla->matriculas()->get();
        foreach ($matriculas as $matricula) {

            $matricula->detalle_matriculas()->update(['estado' => 'APROBADO']);

        }
        return response()->json(['matricula' => $matriculas], 201);
    }

    public function validateCuposPeriodoAcademico(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $malla->matriculas()->where('periodo_academico_id', $request->periodo_academico_id)->update(['estado' => 'APROBADO']);
        $matriculas = $malla->matriculas()->where('periodo_academico_id', $request->periodo_academico_id)->get();
        foreach ($matriculas as $matricula) {

            $matricula->detalle_matriculas()->update(['estado' => 'APROBADO']);

        }
        return response()->json(['matricula' => $matriculas], 201);
    }
}
