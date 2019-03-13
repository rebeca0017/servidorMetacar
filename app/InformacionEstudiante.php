<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InformacionEstudiante extends Model
{
    protected $fillable = [
        'identificacion', 'fecha_aprobacion', 'numero_resolucion','fecha_finalizacion', 'estado',
    ];

    public function matricula()
    {
        return $this->belongsTo('App\Matricula');
    }
}
