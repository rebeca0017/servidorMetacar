<?php

namespace App\Http\Controllers;

use App\Estudiante;
use App\InformacionEstudiante;
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
        $estudiante = Estudiante::where('id', $request->id)
            ->with('pais_nacionalidad')
            ->with('provincia_nacimiento')
            ->with('canton_nacimiento')
            ->with('pais_residencia')
            ->first();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $matricula = Matricula::where('estudiante_id', $request->id)
            ->where('periodo_lectivo_id', $periodoLectivoActual->id)
            ->first();
        $informacionEstudiante = InformacionEstudiante::where('matricula_id', $matricula->id)
            ->with('provincia_residencia')
            ->with('canton_residencia')
            ->first();

        return response()->json([
            'estudiante' => $estudiante,
            'informacion_estudiante' => $informacionEstudiante
        ]);
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
}
