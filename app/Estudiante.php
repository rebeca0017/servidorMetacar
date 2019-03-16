<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estudiante extends Model
{
    protected $fillable = [
        'identificacion',
        'nombre1',
        'nombre2',
        'apellido1',
        'apellido2',
        'fecha_nacimiento',
        'correo_personal',
        'correo_institucional',
        'sexo',
        'etnia',
        'tipo_sangre',
        'tipo_identificacion',
        'tipo_colegio',
        'estado',
    ];

    public function matriculas()
    {
        return $this->hasMany('App\Matricula');
    }
}
