<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PeriodoAcademico extends Model
{
    protected $fillable = [
        'nombre', 'estado',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }

    public function asignaturas(){
        return $this->hasMany('App\Asignatura');
    }
}
