<?php

namespace App\Http\Controllers;

use App\Carrera;
use App\Estudiante;
use App\InformacionEstudiante;
use App\Instituto;
use App\Matricula;
use App\PeriodoLectivo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EstudiantesController extends Controller
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

    public function getOne(Request $request)
    {
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $matricula = Matricula::select(
            'matriculas.*',
            'carreras.id as carrera_id'
        )
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('institutos', 'institutos.id', '=', 'carreras.instituto_id')
            ->join('ubicaciones', 'ubicaciones.id', '=', 'estudiantes.pais_nacionalidad_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->with('tipo_matricula')
            ->where('matriculas.estudiante_id', $request->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->first();
        $estudiante = Estudiante::where('id', $request->id)->with('canton_nacimiento')->first();
        $informacionEstudiante = InformacionEstudiante::where('matricula_id', $matricula->id)->with('canton_residencia')->first();
        $carrera = Carrera::findOrFail($matricula->carrera_id);
        $instituto = Instituto::findOrFail($carrera->instituto_id);
        $ubicacionNacimiento = DB::select('select
    canton.id as canton_id,
    canton.nombre as canton_nombre,
    provincia.id as provincia_id,
    provincia.nombre as provincia_nombre,
    pais.id as pais_id,
    pais.nombre as pais_nombre
from
(select canton.* from ubicaciones as canton inner join estudiantes on canton.id = estudiantes.canton_nacimiento_id
	where estudiantes.id =' . $matricula->estudiante->id . ' limit 1) as canton,
(select provincia.* from ubicaciones as provincia where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_n inner join estudiantes on cantones_n.id = estudiantes.canton_nacimiento_id
	where estudiantes.id = ' . $matricula->estudiante->id . ' limit 1)) as provincia,
(select pais.* from ubicaciones as pais where pais.id =
(select codigo_padre_id from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_n inner join estudiantes on cantones_n.id = estudiantes.canton_nacimiento_id
	where estudiantes.id = ' . $matricula->estudiante->id . ' limit 1))
) as pais');
        $ubicacionResidencia = DB::select('select 
	        canton.id as canton_id,
    canton.nombre as canton_nombre,
    provincia.id as provincia_id,
    provincia.nombre as provincia_nombre,
    pais.id as pais_id,
    pais.nombre as pais_nombre
from
(select canton.* from ubicaciones as canton inner join informacion_estudiantes on canton.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id =' . $informacionEstudiante->id . 'limit 1) as canton,
(select provincia.* from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_r inner join informacion_estudiantes on cantones_r.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id = ' . $informacionEstudiante->id . 'limit 1)) as provincia,
(select pais.* from ubicaciones pais where pais.id =
(select codigo_padre_id from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_r inner join informacion_estudiantes on cantones_r.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id = ' . $informacionEstudiante->id . ' limit 1))
) as pais');

        return response()->json([
            'matricula' => $matricula,
            'estudiante' => $estudiante,
            'informacion_estudiante' => $informacionEstudiante,
            'instituto' => $instituto,
            'carrera' => $carrera,
            'ubicacion_nacimiento' => $ubicacionNacimiento,
            'ubicacion_residencia' => $ubicacionResidencia,
        ], 200);
    }

    public function getEnProceso(Request $request)
    {

        $estudiantes = Estudiante::where('estado', 'EN_PROCESO')->paginate($request->records_per_page);;

        return response()->json(['pagination' => [
            'total' => $estudiantes->total(),
            'current_page' => $estudiantes->currentPage(),
            'per_page' => $estudiantes->perPage(),
            'last_page' => $estudiantes->lastPage(),
            'from' => $estudiantes->firstItem(),
            'to' => $estudiantes->lastItem()],
            'estudiantes' => $estudiantes], 200);
    }

    public function updatePerfil(Request $request)
    {
        $data = $request->json()->all();
        $dataEstudiante = $data['estudiante'];
        $dataInformacionEstudiante = $data['informacion_estudiante'];

        $informacionEstudiante = InformacionEstudiante::findOrFail($dataInformacionEstudiante['id']);
        $estudiante = Estudiante::findOrFail($dataEstudiante['id']);

        $estudiante->update([
            'sexo' => $dataEstudiante['sexo'],
            'genero' => $dataEstudiante['genero'],
            'etnia' => $dataEstudiante['etnia'],
            'pueblo_nacionalidad' => $dataEstudiante['pueblo_nacionalidad'],
            'tipo_sangre' => $dataEstudiante['tipo_sangre'],
            'fecha_nacimiento' => $dataEstudiante['fecha_nacimiento'],
            'tipo_colegio' => $dataEstudiante['tipo_colegio'],
            'correo_personal' => $dataEstudiante['correo_personal'],
            'tipo_bachillerato' => $dataEstudiante['tipo_bachillerato'],
            'anio_graduacion' => $dataEstudiante['anio_graduacion']
        ]);
        $informacionEstudiante->update([
            'estado_civil' => $dataInformacionEstudiante ['estado_civil'],
            'tiene_discapacidad' => $dataInformacionEstudiante ['tiene_discapacidad'],
            'tipo_discapacidad' => $dataInformacionEstudiante ['tipo_discapacidad'],
            'numero_carnet_conadis' => $dataInformacionEstudiante ['numero_carnet_conadis'],
            'porcentaje_discapacidad' => $dataInformacionEstudiante ['porcentaje_discapacidad'],
            'codigo_postal' => $dataInformacionEstudiante ['codigo_postal'],
            'contacto_emergencia_telefono' => $dataInformacionEstudiante ['contacto_emergencia_telefono'],
            'contacto_emergencia_parentesco' => $dataInformacionEstudiante ['contacto_emergencia_parentesco'],
            'contacto_emergencia_nombres' => $dataInformacionEstudiante ['contacto_emergencia_nombres'],
            'habla_idioma_ancestral' => $dataInformacionEstudiante ['habla_idioma_ancestral'],
            'idioma_ancestral' => $dataInformacionEstudiante ['idioma_ancestral'],
            'categoria_migratoria' => $dataInformacionEstudiante ['categoria_migratoria'],
            'posee_titulo_superior' => $dataInformacionEstudiante ['posee_titulo_superior'],
            'titulo_superior_obtenido' => $dataInformacionEstudiante ['titulo_superior_obtenido'],
            'ocupacion' => $dataInformacionEstudiante ['ocupacion'],
            'nombre_empresa_labora' => $dataInformacionEstudiante ['nombre_empresa_labora'],
            'area_trabajo_empresa' => $dataInformacionEstudiante ['area_trabajo_empresa'],
            'destino_ingreso' => $dataInformacionEstudiante ['destino_ingreso'],
            'recibe_bono_desarrollo' => $dataInformacionEstudiante ['recibe_bono_desarrollo'],
            'nivel_formacion_padre' => $dataInformacionEstudiante ['nivel_formacion_padre'],
            'nivel_formacion_madre' => $dataInformacionEstudiante ['nivel_formacion_madre'],
            'ingreso_familiar' => $dataInformacionEstudiante ['ingreso_familiar'],
            'numero_miembros_hogar' => $dataInformacionEstudiante ['numero_miembros_hogar'],
            'telefono_fijo' => $dataInformacionEstudiante ['telefono_fijo'],
            'telefono_celular' => $dataInformacionEstudiante ['telefono_celular'],
            'direccion' => $dataInformacionEstudiante ['direccion'],
        ]);
        return response()->json([
            'estudiante' => $estudiante,
            'informacion_estudiante' => $informacionEstudiante
        ]);
    }

    public function getFormulario(Request $request)
    {
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $matricula = Matricula::select(
            'matriculas.*',
            'institutos.id as instituto_id',
            'institutos.nombre as instituto',
            'carreras.id as carrera_id',
            'ubicaciones.id as pais_nacionalidad'
        )
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('institutos', 'institutos.id', '=', 'carreras.instituto_id')
            ->join('ubicaciones', 'ubicaciones.id', '=', 'estudiantes.pais_nacionalidad_id')
            ->with('estudiante')
            ->with('periodo_academico')
            ->with('periodo_lectivo')
            ->with('tipo_matricula')
            ->where('matriculas.estudiante_id', $request->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->first();
        $informacionEstudiante = InformacionEstudiante::where('matricula_id', $matricula->id)->first();
        $carrera = Carrera::findOrFail($matricula->carrera_id);
        $instituto = Instituto::findOrFail($carrera->instituto_id);
        $ubicacionNacimiento = DB::select('select 
	canton.nombre canton,
	provincia.nombre provincia,
	pais.nombre pais
from
(select * from ubicaciones inner join estudiantes on ubicaciones.id = estudiantes.canton_nacimiento_id
	where estudiantes.id =' . $matricula->estudiante->id . ' limit 1) as canton,
(select * from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_n inner join estudiantes on cantones_n.id = estudiantes.canton_nacimiento_id
	where estudiantes.id = ' . $matricula->estudiante->id . ' limit 1)) as provincia,
(select * from ubicaciones pais where pais.id =
(select codigo_padre_id from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_n inner join estudiantes on cantones_n.id = estudiantes.canton_nacimiento_id
	where estudiantes.id = ' . $matricula->estudiante->id . ' limit 1))
) as pais');
        $ubicacionResidencia = DB::select('select 
	        canton.nombre canton,
	provincia.nombre provincia,
	pais.nombre pais
from
(select * from ubicaciones inner join informacion_estudiantes on ubicaciones.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id =' . $informacionEstudiante->id . 'limit 1) as canton,
(select * from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_r inner join informacion_estudiantes on cantones_r.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id = ' . $informacionEstudiante->id . 'limit 1)) as provincia,
(select * from ubicaciones pais where pais.id =
(select codigo_padre_id from ubicaciones  provincia  where provincia.id = 
 (select codigo_padre_id from ubicaciones cantones_r inner join informacion_estudiantes on cantones_r.id = informacion_estudiantes.canton_residencia_id
	where informacion_estudiantes.id = ' . $informacionEstudiante->id . ' limit 1))
) as pais');


        return response()->json([
            'matricula' => $matricula,
            'informacion_estudiante' => $informacionEstudiante,
            'instituto' => $instituto,
            'carrera' => $carrera,
            'ubicacion_nacimiento' => $ubicacionNacimiento,
            'ubicacion_residencia' => $ubicacionResidencia,
        ], 200);
    }

    public function invoice()
    {
        $pdf = \PDF::loadView('invoice');
        return $pdf->download('ejemplo.pdf');
        return view('invoice');
        $data = $this->getData();
        $date = date('Y-m-d');
        $invoice = "2222";
        $view = \View::make('invoice', compact('data', 'date', 'invoice'))->render();
        $pdf = \App::make('dompdf.wrapper');
        $pdf->loadHTML($view);
        return $pdf->stream('invoice');
    }

    public function getData()
    {
        $data = [
            'quantity' => '1',
            'description' => 'some ramdom text',
            'price' => '500',
            'total' => '500'
        ];
        return $data;
    }

}
