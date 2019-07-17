<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    public function crearCliente(Request $request){
        $data = $request->json()->all();
        $sql = "insert into cliente(nombre,apellido,email,clave,telefono)
                  values(?,?,?,?,?)";
        $parameters = [$data['nombre'], $data['apellido'], $data['email'], $data['clave'], $data['telefono']];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }
    
    public function eliminarCliente(Request $request){
        $data = $request->json()->all();
        $sql = "delete from cliente where id = ?";
        $parameters = [$data['id']];
        $response = DB::select($sql, $parameters);
        return response()->json(true,200);
    }

    public function obtenerCliente(Request $request)
    {
        $data = $request->json()->all();
        $sql = "select * from cliente";
        $response = DB::select($sql);
        return response()->json($response);
    }

    public function obtenerClienteActivo(Request $request)
    {
        $data = $request->json()->all();
        $sql = "select * from cliente where estado = ?";
        $parameters = [$data['estado']];
        $response = DB::select($sql, $parameters);
        return response()->json($response);
    }

    public function actualizarCliente(Request $request)
    {
        $data = $request->json()->all();
        $sql = "update cliente set 
                nombre = ?,
                email= ?,
                clave= ?
                where id = ?";
        $parameters = [$data['nombre'], $data['], $data['email'], $data['clave'], $data['id']];
        DB::select($sql, $parameters);
        return response()->json(true);    
        
    }



    







}

