<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MantenimientoController extends Controller
{
    public function crearMantenimiento(Request $request)
    {
        $data = $request->json()->all();
        $sql = "insert into mantenimiento(id_cliente,id_servicio,id_vehiculo,fecha,hora)
                  values(?,?,?.?,?)";
        $parameters = [$data['id_cliente'], $data['id_servicio'], $data['id_vehiculo'],$data['hora'],$data['fecha']];
        DB::select($sql, $parameters);
        return response()->json(true,201);
    }

    public function actualizarMantenimiento(Request $request)
    {
        $data = $request->json()->all();
        $sql = "update mantenimiento set
        id_cliente=?,
        id_servicio=?,
        id_vehiculo=?,
        fecha=?,
        hora=?
        where id_mantenimiento=?";

        $parameters = [[$data['id_mantenimiento'],[$data['id_cliente'],[$data['id_servicio'],[$data['id_vehiculo'],[$data['fecha'],[$data['hora']]
        DB::select($sql,parameters);
        return response()->json(true,201);
    }

    public function eliminarMantenimiento(Request $request){

        $data = $request->json()->all();
        $sql = "delete from mantenimiento where id_mantenimiento = ?";
        $parameters = [$data['id_mantenimiento']];
        $response = DB::select($sql, $parameters);
        return response()->json(true,201);
    }
    }



}
