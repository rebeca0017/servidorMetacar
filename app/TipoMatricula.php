<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
class TipoMatricula extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $fillable = [
        'nombre', 'fecha_aprobacion', 'numero_resolucion','fecha_finalizacion', 'estado',
    ];

    public function matriculas(){
        return $this->hasMany('App\Matricula');
    }
}
