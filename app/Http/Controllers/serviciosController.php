<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class serviciosController extends Controller
{
     public function crearServicio(Request $request){
        $data = $request->json()->all();
        $sql = "insert into servicio(nombre,codigo,costo,estado,tipo)
                  values(?,?,?,?)"
        $parameters = [$data['nombre']$data['codigo'], $data['costo'], $data['estado'],$data['tipo']];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }
    public function eliminarServicio(Request $request){
        $data = $request->json()->all();
        $sql = "delete from servicio where id = ?";
        $parameters = [$data['id']];
        $response = DB::select($sql, $parameters);
        return response()->json(true,201);
    }

    public function actualizarServicio(Request $request)
    {
        $data = $request->json()->all();
        $sql = "update servicio set 
                nombre = ?,
                codigo= ?,
                costo= ?,
                estado=?
                where id = ?";
        $parameters = [$data['nombre'], $data['codigo'], $data['costo'], $data['estado'],$data['id']];
        DB::select($sql, $parameters);
        return response()->json(true);    
        
    }
    
}