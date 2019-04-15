<?php

namespace App\Http\Controllers;

use App\User;
use App\Carrera;
use App\Notificacion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class EmailsController extends Controller
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

    public function send(Request $request)
    {
        $for = array();
        $correos = DB::select("select correo from notificacion_correos where estado = 'ACTIVO'");
        foreach ($correos as $correo) {
            $for = array($correo->correo);
        }

        $carrera = Carrera::findOrFail($request->carrera_id);
        $user = User::findOrFail($request->user_id);
        $notificacion = new Notificacion($request->asunto, $carrera->nombre, $request->body, $user->name);
        $subject = $request->asunto;

        Mail::send('notificacion', array('notificacion' => $notificacion), function ($msj) use ($subject, $for) {
            $msj->subject($subject);
            $msj->to($for);
        });
    }

}
