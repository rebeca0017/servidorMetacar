<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use function MongoDB\BSON\toJSON;

class UsuarioController extends Controller
{


    public function login(Request $request)
    {
        $data = $request->json()->all();
        $sql = "select usuario.*, rol.id as rol 
                    from usuario inner join rol on rol.id = usuario.id_rol where usuario.nombre = ? and usuario.clave = ?";
        $parameters = [$data['nombre'], $data['clave']];
        $response = DB::select($sql, $parameters);
        return response()->json($response,201);
    }

    public function registrarCliente(Request $request)
    {
        $data = $request->json()->all();
        $sql = "insert into usuario(nombre,correo,clave,estado,id_rol) values(?,?,?,'ACTIVO',2)";
        $parameters = [$data['nombre'], $data['correo'],$data['clave']];
        DB::select($sql, $parameters);

        $sql = "select * from usuario where usuario.nombre = ?";
        $parameters = [$data['nombre']];
        $usuario = DB::select($sql, $parameters);

        $sql = "insert into cliente(id_usuario,estado) values(?,?)";
        $parameters = [$usuario[0]->id,"activo"];
        DB::select($sql, $parameters);

        $sql = "select count(*) from usuario where usuario.nombre = ?";
        $parameters = [$data['nombre']];
        $response = DB::select($sql, $parameters);
        return response()->json($response,201);
    }

    public function probar(){
        $sql = "select *from usuario where usuario.nombre = 'rebe'";

        $response = DB::select($sql);

        return $response[0]->nombre;
    }
}
