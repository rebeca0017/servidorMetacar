<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoMatricula extends Model
{
    protected $fillable = [
        'nombre', 'fecha_aprobacion', 'numero_resolucion','fecha_finalizacion', 'estado',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }
}
