<?php

namespace App\Http\Controllers;

use App\Asignatura;
use App\DetalleMatricula;
use App\Estudiante;
use App\Malla;
use App\Carrera;
use App\Matricula;
use App\PeriodoAcademico;
use App\TipoMatricula;
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

    public function getCupos(Request $request)
    {
        $carrera = Carrera::where('id', $request->carrera_id)->first();
        $malla = Malla::where('carrera_id', $carrera->id)->first();
        if ($request->periodo_academico_id) {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->where('malla_id', $malla->id)
                ->where('periodo_lectivo_id', $request->periodo_lectivo_id)
                ->where('periodo_academico_id', $request->periodo_academico_id)
                ->where('matriculas.estado', 'EN_PROCESO')
                ->with('estudiante')
                ->with('periodo_academico')
                ->orderby('apellido1')
                ->paginate($request->records_per_page);
        } else {
            $cupos = Matricula::select('estudiantes.apellido1', 'matriculas.*')
                ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
                ->where('malla_id', $malla->id)
                ->where('periodo_lectivo_id', $request->periodo_lectivo_id)
                ->where('matriculas.estado', 'EN_PROCESO')
                ->with('estudiante')
                ->with('periodo_academico')
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

    public function getAsignaturasMalla(Request $request)
    {
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $asignaturas = Asignatura::where('malla_id', $malla->id)->with('periodo_academico')->get();
        return response()->json(['asignaturas' => $asignaturas], 200);
    }

    public function updateDetalleMatricula(Request $request)
    {
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
        return response()->json(['detalle_matricula' => $detalleMatricula], 200);
    }

    public function deleteDetalleMatricula(Request $request)
    {
        $detalleMatricula = DetalleMatricula::findOrFail($request->id)->delete();
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

    public function getCupo(Request $request)
    {
        $matricula = Matricula::select('matriculas.*')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->orWhere('identificacion', $request['identificacion'])
            ->orWhere('apellido1', 'like', '%' . $request['apellido1'] . '%')
            ->orWhere('apellido2', 'like', '%' . $request['apellido2'] . '%')
            ->orWhere('nombre1', 'like', '%' . $request['nombre1'] . '%')
            ->orWhere('nombre2', 'like', '%' . $request['nombre2'] . '%')
            ->where('matriculas.periodo_lectivo_id', '4')
            ->where('matriculas.estado', 'EN_PROCESO')
            ->get();
        return response()->json(['cupo' => $matricula], 200);
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
}
