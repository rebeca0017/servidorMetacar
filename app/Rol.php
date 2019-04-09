<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Rol extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $table = 'roles';
    protected $fillable = [
        'descripcion', 'rol', 'estado',
    ];

    public function users()
    {
        return $this->hasMany('App\User');
    }
}
