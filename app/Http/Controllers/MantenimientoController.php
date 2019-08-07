<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MantenimientoController extends Controller
{
    public function crearMantenimiento(Request $request)
    {
        $data = $request->json()->all();
        $sql = "insert into mantenimiento(id_cliente,id_servicio,id_vehiculo,fecha,hora)
                  values(?,?,?,?,?)";
        $parameters = [$data['id_cliente'], $data['id_servicio'], $data['id_vehiculo'], $data['fecha'], $data['hora']];
        DB::select($sql, $parameters);
        return response()->json(true, 201);
    }

    public function obtenerMantenimientosCliente(Request $request)
    {

        $sql = "select mantenimiento.*, servicio.nombre as nombre_servicio from mantenimiento
                join servicio on servicio.id = mantenimiento.id_servicio
                where id_cliente = ?";
        $parameters = [$request->id_cliente];
        $response = DB::select($sql, $parameters);
        return response()->json($response, 200);
    }

    public function obtenerMantenimientosAdministrador(Request $request)
    {

        $sql = "select mantenimiento.*, 
       servicio.nombre as nombre_servicio,
       cliente.nombre as nombre_cliente,
       cliente.apellido as apellido_cliente,
       vehiculo.placas as placa_vehiculo
    from mantenimiento join servicio on servicio.id=mantenimiento.id_servicio
                join cliente on cliente.id = mantenimiento.id_cliente join vehiculo on vehiculo.id=mantenimiento.id_vehiculo";
        $response = DB::select($sql);
        return response()->json($response, 200);
    }

    public function eliminarMantenimiento(Request $request)
    {

        $sql = "delete from mantenimiento where id = ?";
        $parameters = [$request->id];
        $response = DB::select($sql, $parameters);
        return response()->json($response, 200);
    }

}
