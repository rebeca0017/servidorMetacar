<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    public function crearCliente(Request $request){
        $data = $request->json()->all();
        $sql = "insert into cliente(nombre,email,clave,telefono)
                  values(?,?,?,?)";
        $parameters = [$data['nombre'], $data['email'], $data['clave'], $data['telefono']];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }

    public function eliminarCliente(Request $request){
        $data = $request->json()->all();
        $sql = "delete from cliente where id_cliente = ?";
        $parameters = [$data['id']];
        $response = DB::select($sql, $parameters);
        return response()->json(true,200);
    }

    public function obtenerCliente(Request $request)
    {
        $sql = "select * from cliente where id_usuario = ? ";
        $parameters = [$request->id_usuario];
        $response = DB::select($sql,$parameters);
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
                email= ?
                where id_clientes = ?";
        $parameters = [$data['nombre'], $data['email'], $data['id_clientes']];
        DB::select($sql, $parameters);
        return response()->json(true);

    }

    public function registrarVehiculo(Request $request){
        $data = $request->json()->all();
        $sql = "insert into vehiculo(anio,marca,matricula,placas,id_cliente)
                  values(?,?,?,?,?)";
        $parameters = [$data['anio'], $data['marca'], $data['matricula'], $data['placas'],$request->id_cliente];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }
    public function obtenerVehiculos(Request $request)
    {
        $data = $request->json()->all();
        $sql = "select * from vehiculo where id_cliente=?";
        $parameters = [$request->id_cliente];
        $response = DB::select($sql,$parameters);
        return response()->json($response);
    }








}

