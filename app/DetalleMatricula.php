<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetalleMatricula extends Model
{
    protected $fillable = [
        'numero_matricula', 'paralelo', 'jornada','estado',
    ];

    public function matricula()
    {
        return $this->belongsTo('App\Matricula');
    }
    public function tipo_matricula()
    {
        return $this->belongsTo('App\TipoMatricula');
    }
    public function asignatura()
    {
        return $this->belongsTo('App\Asignatura');
    }
}
