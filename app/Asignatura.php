<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Asignatura extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $fillable = [
        'codigo',
        'nombre',
        'horas_practica',
        'horas_docente',
        'horas_autonoma',
        'tipo',
        'estado',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }

    public function periodo_academico()
    {
        return $this->belongsTo('App\PeriodoAcademico');
    }
}
