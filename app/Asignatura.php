<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Asignatura extends Model
{
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
