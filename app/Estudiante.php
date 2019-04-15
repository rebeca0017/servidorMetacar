<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Estudiante extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $fillable = [
        'tipo_identificacion',
        'identificacion',
        'apellido1',
        'apellido2',
        'nombre1',
        'nombre2',
        'sexo',
        'genero',
        'etnia',
        'pueblo_nacionalidad',
        'tipo_sangre',
        'fecha_nacimiento',
        'tipo_colegio',
        'correo_personal',
        'correo_institucional',
        'tipo_bachillerato',
        'anio_graduacion',
        'fecha_inicio_carrera',
        'corte',
        'estado',
    ];

    public function matriculas()
    {
        return $this->hasMany('App\Matricula');
    }

    public function canton_nacimiento()
    {
        return $this->belongsTo('App\Ubicacion');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
