<?php

namespace App\Http\Controllers;

use App\Asignatura;
use App\Carrera;
use App\DetalleMatricula;
use App\DetalleMatriculaTransaccion;
use App\Estudiante;
use App\InformacionEstudiante;
use App\InformacionEstudianteTransaccion;
use App\Malla;
use App\Matricula;
use App\MatriculaTransaccion;
use App\PeriodoAcademico;
use App\PeriodoLectivo;
use App\Role;
use App\TipoMatricula;
use App\User;
use Carbon\Carbon;
use Excel;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Collection as Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ExcelController extends Controller
{

    public function exportMatrizSnieseCarrera(Request $request)
    {
        $now = Carbon::now();
        $periodoLectivoActual = PeriodoLectivo::where('estado', 'ACTUAL')->first();
        $malla = Malla::where('carrera_id', $request->carrera_id)->first();
        $carrera = Carrera::findOrFail($request->carrera_id);

        $matriculados = Matricula::selectRaw(
                'estudiantes.tipo_identificacion as "tipoDocumentoId",
                estudiantes.identificacion as "numeroIdentificacion",
                estudiantes.apellido1 as "primerApellido",
                estudiantes.apellido2 as "segundoApellido",
                estudiantes.nombre1 as "primerNombre",
                estudiantes.nombre2 as "segundoNombre",
                estudiantes.sexo as "sexoId",
                estudiantes.genero as "generoId",
                informacion_estudiantes.estado_civil as "estadocivilId",
                estudiantes.etnia as "etniaId",
                informacion_estudiantes.estado_civil as "estadocivilId",
                estudiantes.pueblo_nacionalidad as "pueblonacionalidadId",
                estudiantes.tipo_sangre as "tipoSangre",
                informacion_estudiantes.tiene_discapacidad as "discapacidad",
                (CASE WHEN informacion_estudiantes.porcentaje_discapacidad is null or informacion_estudiantes.porcentaje_discapacidad = 0 
                    THEN \'NA\' ELSE trim(to_char(informacion_estudiantes.porcentaje_discapacidad,\'99999\')) END) as "porcentajeDiscapacidad",
                (CASE WHEN informacion_estudiantes.numero_carnet_conadis is null or informacion_estudiantes.numero_carnet_conadis = \'\' 
                    THEN \'NA\' ELSE informacion_estudiantes.numero_carnet_conadis END) as "numCarnetConadis",
                informacion_estudiantes.tipo_discapacidad as "tipoDiscapacidad",
                estudiantes.fecha_nacimiento as "fechaNacimiento",
                (CASE WHEN 
                    (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = 
                    (select id from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    )))) is null
                    OR 
                    (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = 
                    (select id from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    )))) = \'\'
                   
                THEN \'NA\' 
                ELSE 
                    (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = 
                    (select id from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    ))))
                END) as "paisNacionalidadId",
                (CASE WHEN
                    (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    )) is null
                    OR
                    (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    )) = \'\'
                THEN \'NA\' 
                ELSE
                (select codigo from ubicaciones where id = 
                    (select codigo_padre_id from ubicaciones where id = estudiantes.canton_nacimiento_id
                    ))
                END) as "provinciaNacimientoId",
                (CASE WHEN 
                (select codigo from ubicaciones where id = estudiantes.canton_nacimiento_id) is null or (select codigo from ubicaciones where id = estudiantes.canton_nacimiento_id) = \'\'
                or (select codigo from ubicaciones where id = estudiantes.canton_nacimiento_id) = \'43\' or (select codigo from ubicaciones where id = estudiantes.canton_nacimiento_id) = \'0\'
                THEN \'NA\' 
                ELSE
                    (select codigo from ubicaciones where id = estudiantes.canton_nacimiento_id)
                END) as "cantonNacimientoId",
                (select codigo from ubicaciones where id = (select codigo_padre_id from ubicaciones where id = (select id from ubicaciones where id = (select codigo_padre_id from ubicaciones where id = informacion_estudiantes.canton_residencia_id)))) as "paisResidenciaId",
                (select codigo from ubicaciones where id = (select codigo_padre_id from ubicaciones where id = informacion_estudiantes.canton_residencia_id)) as "provinciaResidenciaId", 
                (select codigo from ubicaciones where id = informacion_estudiantes.canton_residencia_id) as "cantonResidenciaId",
                estudiantes.tipo_colegio as "tipoColegioId",
                carreras.modalidad as "modalidadCarrera",
                matriculas.jornada as "jornadaCarrera",
                estudiantes.fecha_inicio_carrera as "fechaInicioCarrera",
                matriculas.fecha as "fechaMatricula",
                matriculas.tipo_matricula_id as "tipoMatriculaId",
                matriculas.periodo_academico_id as "nivelAcademicoQueCursa",
                mallas.numero_semanas as "duracionPeriodoAcademico",
                informacion_estudiantes.ha_repetido_asignatura as "haRepetidoAlMenosUnaMateria",
                matriculas.paralelo_principal as "paraleloId",
                informacion_estudiantes.ha_perdido_gratuidad as "haPerdidoLaGratuidad",
                informacion_estudiantes.pension_diferenciada as "recibePensionDiferenciada",
                informacion_estudiantes.ocupacion as "estudianteocupacionId",
                informacion_estudiantes.destino_ingreso as "ingresosestudianteId",
                informacion_estudiantes.recibe_bono_desarrollo as "bonodesarrolloId",
                informacion_estudiantes.ha_realizado_practicas as "haRealizadoPracticasPreprofesionales",
                (CASE WHEN informacion_estudiantes.horas_practicas is null or informacion_estudiantes.horas_practicas = 0 
                    THEN \'NA\' ELSE trim(to_char(informacion_estudiantes.horas_practicas,\'99999\')) END) as "nroHorasPracticasPreprofesionalesPorPeriodo",
                informacion_estudiantes.tipo_institucion_practicas as "entornoInstitucionalPracticasProfesionales",
                informacion_estudiantes.sector_economico_practica as "sectorEconomicoPracticaProfesional",
                informacion_estudiantes.tipo_beca as "tipoBecaId",
                informacion_estudiantes.razon_beca1 as "primeraRazonBecaId",
                informacion_estudiantes.razon_beca2 as "segundaRazonBecaId",
                informacion_estudiantes.razon_beca3 as "terceraRazonBecaId",
                informacion_estudiantes.razon_beca4 as "cuartaRazonBecaId",
                informacion_estudiantes.razon_beca5 as "quintaRazonBecaId",
                informacion_estudiantes.razon_beca6 as "sextaRazonBecaId",
                informacion_estudiantes.monto_beca as "montoBeca",
                informacion_estudiantes.porciento_beca_cobertura_arancel as "porcientoBecaCoberturaArancel",
                informacion_estudiantes.porciento_beca_cobertura_manutencion as "porcientoBecaCoberturaManuntencion",
                informacion_estudiantes.tipo_financiamiento_beca as "financiamientoBeca",
                informacion_estudiantes.monto_ayuda_economica as "montoAyudaEconomica",
                informacion_estudiantes.monto_credito_educativo as "montoCreditoEducativo",
                informacion_estudiantes.ha_realizado_vinculacion as "participaEnProyectoVinculacionSocieda",
                informacion_estudiantes.alcance_vinculacion as "tipoAlcanceProyectoVinculacionId",  
       			estudiantes.correo_institucional as "correoElectronico",
                informacion_estudiantes.telefono_celular as "numeroCelular",
                informacion_estudiantes.nivel_formacion_padre as "nivelFormacionPadre",
                informacion_estudiantes.nivel_formacion_madre as "nivelFormacionMadre",
                informacion_estudiantes.ingreso_familiar as "ingresoTotalHogar",
                informacion_estudiantes.numero_miembros_hogar as "cantidadMiembrosHogar"')
            ->join('estudiantes', 'estudiantes.id', 'matriculas.estudiante_id')
            ->join('mallas', 'mallas.id', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', 'matriculas.tipo_matricula_id')
            ->join('informacion_estudiantes', 'informacion_estudiantes.matricula_id', 'matriculas.id')
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->where('matriculas.estado', 'MATRICULADO')
            ->orderBy('matriculas.estado', 'DESC')
            ->orderBy('matriculas.periodo_academico_id')
            ->orderBy('estudiantes.apellido1')
            ->get();


//        return $matriculados;

        Excel::create('Matriz_' . $carrera->siglas . '_' . $now->format('Y-m-d H:i:s'),
            function ($excel) use ($matriculados) {
                $excel->sheet('Carreras', function ($sheet) use ($matriculados) {
                    $sheet->fromArray($matriculados);
                });
            })->download('xlsx');
    }

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
            'estudiantes.correo_institucional',
            'informacion_estudiantes.telefono_celular',
            'informacion_estudiantes.telefono_fijo',
            'asignaturas.codigo as codigo_asignatura',
            'asignaturas.nombre as asignatura',
            'detalle_matriculas.numero_matricula',
            'asignaturas.periodo_academico_id as periodo_academico'
        )
            ->selectRaw("(CASE 
                            WHEN detalle_matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN detalle_matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN detalle_matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN detalle_matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_asignatura,
                            
                            (CASE 
                            WHEN detalle_matriculas.paralelo = '1' THEN 'A' 
                            WHEN detalle_matriculas.paralelo = '2' THEN 'B'
                            WHEN detalle_matriculas.paralelo = '3' THEN 'C'
                            WHEN detalle_matriculas.paralelo = '4' THEN 'D'
                            WHEN detalle_matriculas.paralelo = '5' THEN 'E'
                            WHEN detalle_matriculas.paralelo = '6' THEN 'F'
                            WHEN detalle_matriculas.paralelo = '7' THEN 'G'
                            WHEN detalle_matriculas.paralelo = '8' THEN 'H'
                            WHEN detalle_matriculas.paralelo = '9' THEN 'I'
                            WHEN detalle_matriculas.paralelo = '10' THEN 'J'
                            WHEN detalle_matriculas.paralelo = '11' THEN 'K'
                            WHEN detalle_matriculas.paralelo = '12' THEN 'L'
                            WHEN detalle_matriculas.paralelo = '13' THEN 'M'
                            WHEN detalle_matriculas.paralelo = '14' THEN 'N' END) AS paralelo_asignatura,
                            
                            (CASE 
                            WHEN detalle_matriculas.numero_matricula = '1' THEN 'PRIMERA' 
                            WHEN detalle_matriculas.numero_matricula = '2' THEN 'SEGUNDA'
                            WHEN detalle_matriculas.numero_matricula = '3' THEN 'TERCERA' END) AS numero_matricula,
                            
                            tipo_matriculas.nombre as tipo_matricula,             
                            
                            (CASE 
                            WHEN matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_principal,
                            
                            (CASE 
                            WHEN matriculas.paralelo_principal = '1' THEN 'A' 
                            WHEN matriculas.paralelo_principal = '2' THEN 'B'
                            WHEN matriculas.paralelo_principal = '3' THEN 'C'
                            WHEN matriculas.paralelo_principal = '4' THEN 'D'
                            WHEN matriculas.paralelo_principal = '5' THEN 'E'
                            WHEN matriculas.paralelo_principal = '6' THEN 'F'
                            WHEN matriculas.paralelo_principal = '7' THEN 'G'
                            WHEN matriculas.paralelo_principal = '8' THEN 'H'
                            WHEN matriculas.paralelo_principal = '9' THEN 'I'
                            WHEN matriculas.paralelo_principal = '10' THEN 'J'
                            WHEN matriculas.paralelo_principal = '11' THEN 'K'
                            WHEN matriculas.paralelo_principal = '12' THEN 'L'
                            WHEN matriculas.paralelo_principal = '13' THEN 'M'
                            WHEN matriculas.paralelo_principal = '14' THEN 'N' END) AS paralelo_principal,
                            
                            matriculas.periodo_academico_id as periodo_academico_principal,
                            detalle_matriculas.estado
                            
                            ")
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', '=', 'detalle_matriculas.tipo_matricula_id')
            ->join('informacion_estudiantes', 'informacion_estudiantes.matricula_id', '=', 'matriculas.id')
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderBy('matriculas.periodo_academico_id')
            ->orderBy('estudiantes.apellido1')
            ->get();
        $listas = Matricula::select(
            'carreras.nombre as carrera',
            'carreras.descripcion as malla',
            'estudiantes.identificacion as cedula_estudiante',
            'estudiantes.apellido1',
            'estudiantes.apellido2',
            'estudiantes.nombre1',
            'estudiantes.nombre2',
            'estudiantes.sexo',
            'estudiantes.correo_institucional',
            'informacion_estudiantes.telefono_celular',
            'informacion_estudiantes.telefono_fijo',
            'tipo_matriculas.nombre as tipo_matricula',
            // 'matriculas.paralelo_principal as paralelo_principal',
            // 'matriculas.jornada as jornada_principal',
            'matriculas.periodo_academico_id as periodo_academico_principal'

        )
            ->selectRaw("(CASE 
                            WHEN matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_principal,
                            
                            (CASE 
                            WHEN matriculas.paralelo_principal = '1' THEN 'A' 
                            WHEN matriculas.paralelo_principal = '2' THEN 'B'
                            WHEN matriculas.paralelo_principal = '3' THEN 'C'
                            WHEN matriculas.paralelo_principal = '4' THEN 'D'
                            WHEN matriculas.paralelo_principal = '5' THEN 'E'
                            WHEN matriculas.paralelo_principal = '6' THEN 'F'
                            WHEN matriculas.paralelo_principal = '7' THEN 'G'
                            WHEN matriculas.paralelo_principal = '8' THEN 'H'
                            WHEN matriculas.paralelo_principal = '9' THEN 'I'
                            WHEN matriculas.paralelo_principal = '10' THEN 'J'
                            WHEN matriculas.paralelo_principal = '11' THEN 'K'
                            WHEN matriculas.paralelo_principal = '12' THEN 'L'
                            WHEN matriculas.paralelo_principal = '13' THEN 'M'
                            WHEN matriculas.paralelo_principal = '14' THEN 'N' END) AS paralelo_principal,
                            matriculas.estado
                            
                            ")
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', '=', 'matriculas.tipo_matricula_id')
            ->join('informacion_estudiantes', 'informacion_estudiantes.matricula_id', '=', 'matriculas.id')
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderBy('matriculas.periodo_academico_id')
            ->orderBy('estudiantes.apellido1')
            ->get();

        Excel::create('Cupos_' . $carrera->siglas . '_' . $now->format('Y-m-d H:i:s'),
            function ($excel) use (&$cupos, &$listas) {
                $excel->sheet('Cupos', function ($sheet) use (&$request, &$cupos) {
                    $sheet->fromArray($cupos);
                });

                $excel->sheet('Listas', function ($sheet) use (&$request, &$listas) {
                    $sheet->fromArray($listas);
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
            'estudiantes.identificacion as cedula_estudiante',
            'estudiantes.apellido1',
            'estudiantes.apellido2',
            'estudiantes.nombre1',
            'estudiantes.nombre2',
            'estudiantes.correo_institucional',
            'informacion_estudiantes.telefono_celular',
            'informacion_estudiantes.telefono_fijo',
            'asignaturas.codigo as codigo_asignatura',
            'asignaturas.nombre as asignatura',
            'detalle_matriculas.numero_matricula',
            'asignaturas.periodo_academico_id as periodo_academico'
        // 'detalle_matriculas.jornada as jornada_asignatura',
        // 'detalle_matriculas.paralelo as paralelo_asignatura',
        // 'detalle_matriculas.numero_matricula as numero_matricula',
        // 'tipo_matriculas.nombre as tipo_matricula',
        // 'matriculas.jornada as jornada_principal',
        // 'matriculas.paralelo_principal as paralelo_principal',
        // 'matriculas.periodo_academico_id as periodo_academico_principal',
        // 'matriculas.estado'
        )
            ->selecTRaw("(CASE 
                            WHEN detalle_matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN detalle_matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN detalle_matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN detalle_matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_asignatura,
                            
                            (CASE 
                            WHEN detalle_matriculas.paralelo = '1' THEN 'A' 
                            WHEN detalle_matriculas.paralelo = '2' THEN 'B'
                            WHEN detalle_matriculas.paralelo = '3' THEN 'C'
                            WHEN detalle_matriculas.paralelo = '4' THEN 'D'
                            WHEN detalle_matriculas.paralelo = '5' THEN 'E'
                            WHEN detalle_matriculas.paralelo = '6' THEN 'F'
                            WHEN detalle_matriculas.paralelo = '7' THEN 'G'
                            WHEN detalle_matriculas.paralelo = '8' THEN 'H'
                            WHEN detalle_matriculas.paralelo = '9' THEN 'I'
                            WHEN detalle_matriculas.paralelo = '10' THEN 'J'
                            WHEN detalle_matriculas.paralelo = '11' THEN 'K'
                            WHEN detalle_matriculas.paralelo = '12' THEN 'L'
                            WHEN detalle_matriculas.paralelo = '13' THEN 'M'
                            WHEN detalle_matriculas.paralelo = '14' THEN 'N' END) AS paralelo_asignatura,
                            
                            (CASE 
                            WHEN detalle_matriculas.numero_matricula = '1' THEN 'PRIMERA' 
                            WHEN detalle_matriculas.numero_matricula = '2' THEN 'SEGUNDA'
                            WHEN detalle_matriculas.numero_matricula = '3' THEN 'TERCERA' END) AS numero_matricula,
                            
                            tipo_matriculas.nombre as tipo_matricula,             
                            
                            (CASE 
                            WHEN matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_principal,
                            
                            (CASE 
                            WHEN matriculas.paralelo_principal = '1' THEN 'A' 
                            WHEN matriculas.paralelo_principal = '2' THEN 'B'
                            WHEN matriculas.paralelo_principal = '3' THEN 'C'
                            WHEN matriculas.paralelo_principal = '4' THEN 'D'
                            WHEN matriculas.paralelo_principal = '5' THEN 'E'
                            WHEN matriculas.paralelo_principal = '6' THEN 'F'
                            WHEN matriculas.paralelo_principal = '7' THEN 'G'
                            WHEN matriculas.paralelo_principal = '8' THEN 'H'
                            WHEN matriculas.paralelo_principal = '9' THEN 'I'
                            WHEN matriculas.paralelo_principal = '10' THEN 'J'
                            WHEN matriculas.paralelo_principal = '11' THEN 'K'
                            WHEN matriculas.paralelo_principal = '12' THEN 'L'
                            WHEN matriculas.paralelo_principal = '13' THEN 'M'
                            WHEN matriculas.paralelo_principal = '14' THEN 'N' END) AS paralelo_principal,
                            
                            matriculas.periodo_academico_id as periodo_academico_principal,
                            
                            matriculas.estado
                            
                            ")
            ->join('detalle_matriculas', 'detalle_matriculas.matricula_id', '=', 'matriculas.id')
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('asignaturas', 'asignaturas.id', '=', 'detalle_matriculas.asignatura_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', '=', 'detalle_matriculas.tipo_matricula_id')
            ->join('informacion_estudiantes', 'informacion_estudiantes.matricula_id', '=', 'matriculas.id')
            ->where('matriculas.periodo_academico_id', $request->periodo_academico_id)
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderby('estudiantes.apellido1')
            ->get();

        $listas = Matricula::select(
            'carreras.nombre as carrera',
            'carreras.descripcion as malla',
            'estudiantes.identificacion as cedula_estudiante',
            'estudiantes.apellido1',
            'estudiantes.apellido2',
            'estudiantes.nombre1',
            'estudiantes.nombre2',
            'estudiantes.sexo',
            'estudiantes.correo_institucional',
            'informacion_estudiantes.telefono_celular',
            'informacion_estudiantes.telefono_fijo',
            'tipo_matriculas.nombre as tipo_matricula',
            // 'matriculas.paralelo_principal as paralelo_principal',
            // 'matriculas.jornada as jornada_principal',
            'matriculas.periodo_academico_id as periodo_academico_principal'

        )
            ->selecTRaw("(CASE 
                            WHEN matriculas.jornada = '1' THEN 'MATUTINA' 
                            WHEN matriculas.jornada = '2' THEN 'VESPERTINA'
                            WHEN matriculas.jornada = '3' THEN 'NOCTURNA'
                            WHEN matriculas.jornada = '4' THEN 'INTENSIVA' END) AS jornada_principal,
                            
                            (CASE 
                            WHEN matriculas.paralelo_principal = '1' THEN 'A' 
                            WHEN matriculas.paralelo_principal = '2' THEN 'B'
                            WHEN matriculas.paralelo_principal = '3' THEN 'C'
                            WHEN matriculas.paralelo_principal = '4' THEN 'D'
                            WHEN matriculas.paralelo_principal = '5' THEN 'E'
                            WHEN matriculas.paralelo_principal = '6' THEN 'F'
                            WHEN matriculas.paralelo_principal = '7' THEN 'G'
                            WHEN matriculas.paralelo_principal = '8' THEN 'H'
                            WHEN matriculas.paralelo_principal = '9' THEN 'I'
                            WHEN matriculas.paralelo_principal = '10' THEN 'J'
                            WHEN matriculas.paralelo_principal = '11' THEN 'K'
                            WHEN matriculas.paralelo_principal = '12' THEN 'L'
                            WHEN matriculas.paralelo_principal = '13' THEN 'M'
                            WHEN matriculas.paralelo_principal = '14' THEN 'N' END) AS paralelo_principal,
                            matriculas.estado
                            
                            ")
            ->join('estudiantes', 'estudiantes.id', '=', 'matriculas.estudiante_id')
            ->join('mallas', 'mallas.id', '=', 'matriculas.malla_id')
            ->join('carreras', 'carreras.id', '=', 'mallas.carrera_id')
            ->join('tipo_matriculas', 'tipo_matriculas.id', '=', 'matriculas.tipo_matricula_id')
            ->join('informacion_estudiantes', 'informacion_estudiantes.matricula_id', '=', 'matriculas.id')
            ->where('matriculas.periodo_academico_id', $request->periodo_academico_id)
            ->where('matriculas.malla_id', $malla->id)
            ->where('matriculas.periodo_lectivo_id', $periodoLectivoActual->id)
            ->orderBy('matriculas.estado', 'DESC')
            ->orderby('estudiantes.apellido1')
            ->get();

        Excel::create($request->periodo_academico_id . '_' . 'Cupos_' . $carrera->siglas . '_' . $now->format('Y-m-d H:i:s'),
            function ($excel) use (&$cupos, &$listas) {
                $excel->sheet('Cupos', function ($sheet) use (&$request, &$cupos) {
                    $sheet->fromArray($cupos);
                });

                $excel->sheet('Listas', function ($sheet) use (&$request, &$listas) {
                    $sheet->fromArray($listas);
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

    public function importCuposRespaldo(Request $request)
    {
        if ($request->file('archivo')) {
            $errors = array();
            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '/app/' . $pathFile;
            $i = 0;
            $countCuposNuevos = 0;
            $countCuposModificados = 0;

            $response = Excel::load($path, function ($reader)
            use ($request, &$errors, $i, &$countCuposNuevos, &$countCuposModificados) {
                $now = Carbon::now();
                $identificacion = '';
                $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
                $malla = Malla::where('carrera_id', $request->carrera_id)->first();

                foreach ($reader->get() as $row) {
                    try {
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('identificacion', trim($row->cedula_estudiante))->first();
                        $asignatura = Asignatura::where('codigo', trim(strtoupper($row->codigo_asignatura)))
                            ->where('malla_id', $malla->id)
                            ->first();
                        if ($estudiante && $asignatura) {
                            $existeMatricula = MatriculaTransaccion::where('estudiante_id', $estudiante->id)
                                ->where('periodo_lectivo_id', $periodoLectivo->id)
                                ->first();
                            if (!$existeMatricula) {
                                $identificacion = $row->cedula_estudiante;
                                $countCuposNuevos++;
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
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
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
                                    $matricula->informacion_estudiantes()->create([
                                        'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                        'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                    ]);
                                }

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            } else if (!($existeMatricula->estado == 'MATRICULADO'
                                || $existeMatricula->estado == 'APROBADO')) {

                                if ($identificacion != $row->cedula_estudiante) {
                                    $countCuposModificados++;
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

                                    $existeDetalleMatricula->update([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura)
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $existeDetalleMatricula->matricula()->associate($existeMatricula);
                                    $existeDetalleMatricula->asignatura()->associate($asignatura);
                                    $existeDetalleMatricula->tipo_matricula()->associate($tipoMatricula);
                                    $existeDetalleMatricula->save();
                                } else {

                                    $detalleMatriculas = new DetalleMatriculaTransaccion([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura),
                                        'estado' => 'EN_PROCESO'
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $detalleMatriculas->matricula()->associate($existeMatricula);
                                    $detalleMatriculas->asignatura()->associate($asignatura);
                                    $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                    $detalleMatriculas->save();
                                }

                            }
                        } else {
                            if (!$estudiante && $row->cedula_estudiante != '') {
                                $errors['cedulas_estudiante'][] = 'cedula_estudiante: ' . $row->cedula_estudiante . ' - fila: ' . ($i + 1) . ' nuevo estudiante agregado';

                                $countCuposNuevos++;
                                $usuario = new User([
                                    'name' => strtoupper($row->apellido1 . ' ' . $row->nombre1),
                                    'user_name' => strtoupper($row->cedula_estudiante),
                                    'email' => strtolower($row->correo_institucional),
                                    'user_name' => $row->cedula_estudiante,
                                    'password' => Hash::make($row->cedula_estudiante),
                                ]);

                                $rol = Role::findOrFail(2);
                                $usuario->role()->associate($rol);
                                $usuario->save();
                                $usuario->carreras()->attach($request->carrera_id);

                                $estudiante = $usuario->estudiante()->create([
                                    'tipo_identificacion' => $row->tipo_identificacion,
                                    'identificacion' => $row->cedula_estudiante,
                                    'apellido1' => strtoupper($row->apellido1),
                                    'apellido2' => strtoupper($row->apellido2),
                                    'nombre1' => strtoupper($row->nombre1),
                                    'nombre2' => strtoupper($row->nombre2),
                                    'correo_institucional' => strtolower($row->correo_institucional),
                                    'fecha_nacimiento' => $row->fecha_nacimiento,
                                    'tipo_sangre' => $this->changeTiposangre($row->tipo_sangre),
                                    'tipo_colegio' => $row->tipo_colegio,
                                    'tipo_bachillerato' => $row->tipo_bachillerato,
                                    //'anio_graduacion' => $row->anio_graduacion,
                                    'fecha_inicio_carrera' => $row->fecha_inicio_carrera
                                ]);

                                $matricula = new MatriculaTransaccion([
                                    'fecha' => $now,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $periodoAcademico = PeriodoAcademico::where('id', strtoupper($row->periodo_academico_principal))
                                    ->first();
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
                                $matricula->save();

                                $matricula->informacion_estudiantes()->create([
                                    'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                    'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                ]);

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            }
                            if (!$asignatura) {
                                $errors['asignaturas'][] = 'codigo_asignatura: ' . $row->codigo_asignatura . ' - fila: ' . ($i + 1) . ' no existe';
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
            // return response()->json(['respuesta' => $response]);

            return response()->json([
                'errores' => $errors,
                'registros' => $i,
                'total_cupos_nuevos' => $countCuposNuevos,
                'total_cupos_modificados' => $countCuposModificados
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

    public function importCupos(Request $request)
    {
        if ($request->file('archivo')) {
            $errors = array();
            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '/app/' . $pathFile;
            $i = 0;
            $countCuposNuevos = 0;
            $countCuposModificados = 0;

            $response = Excel::load($path, function ($reader)
            use ($request, &$errors, $i, &$countCuposNuevos, &$countCuposModificados) {
                $now = Carbon::now();
                $identificacion = '';
                $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
                $malla = Malla::where('carrera_id', $request->carrera_id)->first();

                foreach ($reader->get() as $row) {
                    try {
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('identificacion', trim($row->cedula_estudiante))->first();
                        $estudianteCorreo = Estudiante::where('identificacion', trim($row->cedula_estudiante))
                            ->where('correo_institucional', trim($row->correo_institucional))->first();
                        $correo = Estudiante::where('correo_institucional', trim($row->correo_institucional))->first();
                        $asignatura = Asignatura::where('codigo', trim(strtoupper($row->codigo_asignatura)))
                            ->where('malla_id', $malla->id)
                            ->first();
                        if ($estudiante && $asignatura) {
                            $existeMatricula = MatriculaTransaccion::where('estudiante_id', $estudiante->id)
                                ->where('periodo_lectivo_id', $periodoLectivo->id)
                                ->first();
                            if (!$existeMatricula) {
                                $identificacion = $row->cedula_estudiante;
                                $countCuposNuevos++;
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
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
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
                                    $matricula->informacion_estudiantes()->create([
                                        'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                        'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                    ]);
                                }

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            } else if (!($existeMatricula->estado == 'MATRICULADO'
                                || $existeMatricula->estado == 'APROBADO')) {

                                if ($identificacion != $row->cedula_estudiante) {
                                    $countCuposModificados++;
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

                                    $existeDetalleMatricula->update([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura)
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $existeDetalleMatricula->matricula()->associate($existeMatricula);
                                    $existeDetalleMatricula->asignatura()->associate($asignatura);
                                    $existeDetalleMatricula->tipo_matricula()->associate($tipoMatricula);
                                    $existeDetalleMatricula->save();
                                } else {

                                    $detalleMatriculas = new DetalleMatriculaTransaccion([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura),
                                        'estado' => 'EN_PROCESO'
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $detalleMatriculas->matricula()->associate($existeMatricula);
                                    $detalleMatriculas->asignatura()->associate($asignatura);
                                    $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                    $detalleMatriculas->save();
                                }

                            }
                        } else {
                            if (!$estudiante && $row->cedula_estudiante != '') {
                                $errors['cedulas_estudiante'][] = 'cedula_estudiante: '
                                    . $row->cedula_estudiante . ' - fila: ' . ($i + 1) . ' nuevo estudiante agregado';

                                $countCuposNuevos++;
                                $usuario = new User([
                                    'name' => strtoupper($row->apellido1 . ' ' . $row->nombre1),
                                    'user_name' => strtoupper($row->cedula_estudiante),
                                    'email' => strtolower($row->correo_institucional),
                                    'user_name' => $row->cedula_estudiante,
                                    'password' => Hash::make($row->cedula_estudiante),
                                ]);

                                $rol = Role::findOrFail(2);
                                $usuario->role()->associate($rol);
                                $usuario->save();
                                $usuario->carreras()->attach($request->carrera_id);

                                $estudiante = $usuario->estudiante()->create([
                                    'tipo_identificacion' => $row->tipo_identificacion,
                                    'identificacion' => $row->cedula_estudiante,
                                    'apellido1' => strtoupper($row->apellido1),
                                    'apellido2' => strtoupper($row->apellido2),
                                    'nombre1' => strtoupper($row->nombre1),
                                    'nombre2' => strtoupper($row->nombre2),
                                    'correo_institucional' => strtolower($row->correo_institucional),
                                    'fecha_nacimiento' => $row->fecha_nacimiento,
                                    'tipo_sangre' => $this->changeTiposangre($row->tipo_sangre),
                                    'tipo_colegio' => $row->tipo_colegio,
                                    'tipo_bachillerato' => $row->tipo_bachillerato,
                                    //'anio_graduacion' => $row->anio_graduacion,
                                    'fecha_inicio_carrera' => $row->fecha_inicio_carrera
                                ]);

                                $matricula = new MatriculaTransaccion([
                                    'fecha' => $now,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $periodoAcademico = PeriodoAcademico::where('id', strtoupper($row->periodo_academico_principal))
                                    ->first();
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
                                $matricula->save();

                                $matricula->informacion_estudiantes()->create([
                                    'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                    'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                ]);

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            }
                            if (!$asignatura) {
                                $errors['asignaturas'][] = 'codigo_asignatura: ' . $row->codigo_asignatura . ' - fila: ' . ($i + 1) . ' no existe';
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
            // return response()->json(['respuesta' => $response]);

            return response()->json([
                'errores' => $errors,
                'registros' => $i,
                'total_cupos_nuevos' => $countCuposNuevos,
                'total_cupos_modificados' => $countCuposModificados
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

    public function importCupos2(Request $request)
    {
        if ($request->file('archivo')) {
            $errors = array();
            $pathFile = $request->file('archivo')->store('public/archivos');
            $path = storage_path() . '/app/' . $pathFile;
            $i = 0;
            $countCuposNuevos = 0;
            $countCuposModificados = 0;

            $response = Excel::load($path, function ($reader)
            use ($request, &$errors, $i, &$countCuposNuevos, &$countCuposModificados) {
                $now = Carbon::now();
                $identificacion = '';
                $periodoLectivo = PeriodoLectivo::where('estado', 'ACTUAL')->first();
                $malla = Malla::where('carrera_id', $request->carrera_id)->first();

                foreach ($reader->get() as $row) {
                    DB::beginTransaction();
                    try {
                        $estudiante = Estudiante::where('identificacion', trim($row->cedula_estudiante))->first();
                        $asignatura = Asignatura::where('codigo', trim(strtoupper($row->codigo_asignatura)))
                            ->where('malla_id', $malla->id)
                            ->first();
                        if ($estudiante && $asignatura) {
                            $existeMatricula = MatriculaTransaccion::where('estudiante_id', $estudiante->id)
                                ->where('periodo_lectivo_id', $periodoLectivo->id)
                                ->first();
                            $usuario = $estudiante->user()->first();
                            $usuario->estudiante()->update([
                                'tipo_identificacion' => $row->tipo_identificacion,
                                'identificacion' => $row->cedula_estudiante,
                                'apellido1' => strtoupper($row->apellido1),
                                'apellido2' => strtoupper($row->apellido2),
                                'nombre1' => strtoupper($row->nombre1),
                                'nombre2' => strtoupper($row->nombre2),
                                'correo_institucional' => strtolower($row->correo_institucional),
                                'fecha_nacimiento' => $row->fecha_nacimiento,
                                'tipo_sangre' => $this->changeTiposangre($row->tipo_sangre),
                                'tipo_colegio' => $row->tipo_colegio,
                                'tipo_bachillerato' => $row->tipo_bachillerato,
                                //'anio_graduacion' => $row->anio_graduacion,
                                'fecha_inicio_carrera' => $row->fecha_inicio_carrera
                            ]);
                            if (!$existeMatricula) {
                                $identificacion = $row->cedula_estudiante;
                                $countCuposNuevos++;

                                $matricula = new MatriculaTransaccion([
                                    'fecha' => $now,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $periodoAcademico = PeriodoAcademico::where('id', strtoupper($row->periodo_academico_principal))
                                    ->first();
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
                                $matricula->save();

                                $matricula->informacion_estudiantes()->create([
                                    'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                    'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                ]);

                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();

                            } else if (!($existeMatricula->estado == 'MATRICULADO'
                                || $existeMatricula->estado == 'APROBADO')) {

                                if ($identificacion != $row->cedula_estudiante) {
                                    $countCuposModificados++;
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
                                    $existeDetalleMatricula->update([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura)
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $existeDetalleMatricula->matricula()->associate($existeMatricula);
                                    $existeDetalleMatricula->asignatura()->associate($asignatura);
                                    $existeDetalleMatricula->tipo_matricula()->associate($tipoMatricula);
                                    $existeDetalleMatricula->save();
                                } else {
                                    $detalleMatriculas = new DetalleMatriculaTransaccion([
                                        'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                        'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                        'jornada' => $this->changeJornada($row->jornada_asignatura),
                                        'estado' => 'EN_PROCESO'
                                    ]);
                                    $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))
                                        ->first();
                                    $detalleMatriculas->matricula()->associate($existeMatricula);
                                    $detalleMatriculas->asignatura()->associate($asignatura);
                                    $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                    $detalleMatriculas->save();
                                }

                            }
                        } else {
                            if (!$estudiante) {
                                $countCuposNuevos++;
                                $usuario = new User([
                                    'name' => strtoupper($row->apellido1 . ' ' . $row->nombre1),
                                    'user_name' => strtoupper($row->cedula_estudiante),
                                    'email' => strtolower($row->correo_institucional),
                                    'user_name' => $row->cedula_estudiante,
                                    'password' => Hash::make($row->cedula_estudiante),
                                ]);

                                $rol = Role::findOrFail(2);
                                $usuario->role()->associate($rol);
                                $usuario->save();
                                $usuario->carreras()->attach($request->carrera_id);

                                $estudiante = $usuario->estudiante()->create([
                                    'tipo_identificacion' => $row->tipo_identificacion,
                                    'identificacion' => $row->cedula_estudiante,
                                    'apellido1' => strtoupper($row->apellido1),
                                    'apellido2' => strtoupper($row->apellido2),
                                    'nombre1' => strtoupper($row->nombre1),
                                    'nombre2' => strtoupper($row->nombre2),
                                    'correo_institucional' => strtolower($row->correo_institucional),
                                    'fecha_nacimiento' => $row->fecha_nacimiento,
                                    'tipo_sangre' => $this->changeTiposangre($row->tipo_sangre),
                                    'tipo_colegio' => $row->tipo_colegio,
                                    'tipo_bachillerato' => $row->tipo_bachillerato,
//                                    'anio_graduacion' => $row->anio_graduacion,
                                    'fecha_inicio_carrera' => $row->fecha_inicio_carrera
                                ]);

                                $matricula = new MatriculaTransaccion([
                                    'fecha' => $now,
                                    'jornada' => $this->changeJornada($row->jornada_principal),
                                    'paralelo_principal' => $this->changeParalelo($row->paralelo_principal),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $periodoAcademico = PeriodoAcademico::where('id', strtoupper($row->periodo_academico_principal))
                                    ->first();
                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_principal))->first();
                                $matricula->estudiante()->associate($estudiante);
                                $matricula->periodo_lectivo()->associate($periodoLectivo);
                                $matricula->periodo_academico()->associate($periodoAcademico);
                                $matricula->malla()->associate($malla);
                                $matricula->tipo_matricula()->associate($tipoMatricula);
                                $matricula->save();
                                $matricula->informacion_estudiantes()->create([
                                    'ha_repetido_asignatura' => $row->ha_repetido_asignatura,
                                    'ha_perdido_gratuidad' => $row->ha_perdido_gratuidad
                                ]);
                                $detalleMatriculas = new DetalleMatriculaTransaccion([
                                    'paralelo' => $this->changeParalelo($row->paralelo_asignatura),
                                    'numero_matricula' => $this->changeNumeroMatricula($row->numero_matricula),
                                    'jornada' => $this->changeJornada($row->jornada_asignatura),
                                    'estado' => 'EN_PROCESO'
                                ]);

                                $tipoMatricula = TipoMatricula::where('nombre', strtoupper($row->tipo_matricula_asignatura))->first();
                                $detalleMatriculas->matricula()->associate($matricula);
                                $detalleMatriculas->asignatura()->associate($asignatura);
                                $detalleMatriculas->tipo_matricula()->associate($tipoMatricula);
                                $detalleMatriculas->save();
                                $errors['cedulas_estudiante'][] = 'cedula_estudiante: ' . $row->cedula_estudiante
                                    . ' - fila: ' . ($i + 1) . ' nuevo estudiante agregado';
                            }
                            if (!$asignatura) {
                                $errors['asignaturas'][] = 'codigo_asignatura: ' . $row->codigo_asignatura . ' - fila: ' . ($i + 1) . ' no existe';
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
                'total_cupos_nuevos' => $countCuposNuevos,
                'total_cupos_modificados' => $countCuposModificados
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

            $countEstudiantesNuevos = 0;
            $countEstudiantesModificados = 0;
            $errors = array();

            $response = Excel::load($path, function ($reader)
            use (&$request, &$countEstudiantesModificados, &$countEstudiantesNuevos, &$errors) {
                $i = 0;
                foreach ($reader->get() as $row) {
                    try {
                        $i++;
                        DB::beginTransaction();
                        $estudiante = Estudiante::where('identificacion', $row->cedula_estudiante)->first();
                        $existeCorreo = Estudiante::where('correo_institucional', strtolower($row->correo_institucional))->first();
                        if ($existeCorreo) {
                            $errors['correos'][] = 'correo: ' . strtolower($row->correo_institucional) . ' - fila: ' . $i . ' - Ya existe';
                        }
                        if ($estudiante && $estudiante->estado == 'EN_PROCESO') {
                            $estudiante->update([
                                'identificacion' => strtoupper($row->cedula_estudiante),
                                'nombre1' => strtoupper($row->nombre1),
                                'nombre2' => strtoupper($row->nombre2),
                                'apellido1' => strtoupper($row->apellido1),
                                'apellido2' => strtoupper($row->apellido2),
                                'correo_institucional' => strtolower($row->correo_institucional),
                                'estado' => strtoupper('EN_PROCESO')
                            ]);
                            $countEstudiantesModificados++;
                        } else {
                            $estudiante = new Estudiante();
                            $estudiante->create([
                                'identificacion' => strtoupper($row->cedula_estudiante),
                                'nombre1' => strtoupper($row->nombre1),
                                'nombre2' => strtoupper($row->nombre2),
                                'apellido1' => strtoupper($row->apellido1),
                                'apellido2' => strtoupper($row->apellido2),
                                'correo_institucional' => strtolower($row->correo_institucional),
                                'estado' => strtoupper('EN_PROCESO')
                            ]);
                            $countEstudiantesNuevos++;
                        }
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
                'total_estudiantes_nuevos' => $countEstudiantesNuevos,
                'total_estudiantes_modificados' => $countEstudiantesModificados], 200);
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
        $jornadas = array("MATUTINA", "VESPERTINA", "NOCTURNA", "INTENSIVA", "POR_DEFINIR");
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

    private function changeTipoSangre($tipoSangre)
    {
        $tipoSangre = strtoupper($tipoSangre);
        $tiposSangre = array('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-');
        $indice = array_search($tipoSangre, $tiposSangre, false);
        if ($indice >= 0) {
            return $indice + 1;
        } else {
            return '';
        }
    }

}
