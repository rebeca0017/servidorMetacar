<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class DetalleMatriculaTransaccion extends Model
{
    protected $table='detalle_matriculas';
    protected $fillable = [
        'numero_matricula', 'paralelo', 'jornada', 'estado',
    ];

    public function matricula()
    {
        return $this->belongsTo('App\MatriculaTransaccion');
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
