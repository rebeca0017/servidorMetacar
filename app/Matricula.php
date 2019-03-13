<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Matricula extends Model
{
    protected $fillable = [
        'codigo', 'codigo_sniese_paralelo', 'folio', 'fecha', 'jornada', 'paralelo_principal', 'estado',
    ];

    public function detalleMatriculas(){
        return $this->hasMany('App\DetalleMatricula');
    }

    public function informacionEstudiantes(){
        return $this->hasMany('App\InformacionEstudiante');
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
