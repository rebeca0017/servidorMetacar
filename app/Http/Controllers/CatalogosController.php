<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CatalogosController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getPaises()
    {


        $sql = "SELECT * FROM ubicaciones WHERE tipo='PAIS'";
        $paises = DB::select($sql);

        return response()->json(['paises' => $paises], 200);
    }

    public function getProvincias()
    {
        $sql = "SELECT * FROM ubicaciones WHERE tipo='PROVINCIA'";
        $provincias = DB::select($sql);

        return response()->json(['provincias' => $provincias], 200);
    }

    public function getCantones(Request $request)
    {

        $sql = "SELECT * FROM ubicaciones WHERE tipo='CANTON' AND codigo_padre_id=" . $request->provincia_id;
        $cantones = DB::select($sql);

        return response()->json(['cantones' => $cantones], 200);
    }

    public function getCarreras()
    {
        //$data = $request->json()->all();
        $sql = "SELECT * FROM carreras WHERE estado = 'ACTIVO'";
        $carreras = DB::select($sql);
        return response()->json(['carreras' => $carreras], 200);
    }

    public function getPeriodoAcademicos()
    {
        //$data = $request->json()->all();
        $sql = "SELECT * FROM periodo_academicos WHERE estado = 'ACTIVO'";
        $periodo_academicos = DB::select($sql);
        return response()->json(['periodo_academicos' => $periodo_academicos], 200);
    }
}
