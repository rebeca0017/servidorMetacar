<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class VehiculoController extends Controller
{
    public function guardarAuto(Request $request){
        $data = $request->json()->all();
        $sql = "insert into auto(cliente,anio,marca,matricula,placas,estado)
                  values(?,?,?,?,?,?)";
        $parameters = [$data['id_cliente'],$data['anio'], $data['marca'], $data['matricula'], $data['placas'],$data['estado']];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }

    public function eliminarAuto(Request $request){
        $data = $request->json()->all();
        $sql = "delete from auto where id = ?";
        $parameters = [$data['id']];
        $response = DB::select($sql, $parameters);
        return response()->json(true,201);
    }

    public function obtenerAuto(Request $request)
    {
        $data = $request->json()->all();
        $sql = "select * from auto";
        $response = DB::select($sql);
        return response()->json($response);
    }


    public function actualizarAutoClientes(Request $request)
    {
        $data = $request->json()->all();
        $sql = "update auto set 
                anio = ?,
                placas= ?,
                marca= ?,
                matricula= ?,
                estado=?
                where id = ?";
        $parameters = [$data['anio'], $data['placas'], $data['marca'], $data['matricula'], $data['estado'],$data['id']];
        DB::select($sql, $parameters);
        return response()->json(true);

    }
}
