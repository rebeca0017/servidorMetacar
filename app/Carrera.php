<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Carrera extends Model
{
    protected $fillable = [
        'codigo', 'codigo_sniese', 'nombre', 'descripcion', 'numero_resolucion', 'titulo_otorga', 'siglas',
        'tipo_carrera', 'estado',
    ];

    public function mallas()
    {
        return $this->hasMany('App\Malla');
    }
}
