<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PeriodoLectivo extends Model
{
    protected $fillable = [
        'codigo', 'nombre', 'estado',
    ];

    public function matriculas()
    {
        return $this->hasMany('App\Matricula');
    }
}
