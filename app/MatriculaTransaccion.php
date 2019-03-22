<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MatriculaTransaccion extends Model
{

    protected $table='matriculas';
    protected $fillable = [
        'codigo', 'codigo_sniese_paralelo', 'folio', 'fecha', 'jornada', 'paralelo_principal', 'estado',
    ];

    public function detalle_matriculas()
    {
        return $this->hasMany('App\DetalleMatriculaTransaccion');
    }

    public function informacion_estudiantes()
    {
        return $this->hasOne('App\InformacionEstudianteTransaccion','matricula_id');
    }

    public function estudiante()
    {
        return $this->belongsTo('App\Estudiante');
    }

    public function periodo_lectivo()
    {
        return $this->belongsTo('App\PeriodoLectivo');
    }

    public function periodo_academico()
    {
        return $this->belongsTo('App\PeriodoAcademico')->orderBy('nombre');
    }

    public function malla()
    {
        return $this->belongsTo('App\PeriodoAcademico');
    }
}
