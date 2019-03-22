<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Auditoria extends Model
{
    protected $fillable = [
        'user_id',
        'tabla_id',
        'nombre_tabla',
        'accion',
        'descripcion',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }

    public function periodo_academico()
    {
        return $this->belongsTo('App\PeriodoAcademico');
    }
}
