<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estudiante extends Model
{
    protected $fillable = [
        'identificacion', 'fecha_aprobacion', 'numero_resolucion','fecha_finalizacion', 'estado',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }
}
