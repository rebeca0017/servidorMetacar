<?php

namespace App\Http\Controllers;

use App\Asignatura;
use App\Carrera;
use App\Mail\Email;
use App\Notificacion;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Matricula;
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
        $carrera = Carrera::findOrFail($request->carrera_id);
        $notificacion = new Notificacion($request->asunto, $carrera->nombre, $request->body);
        $subject = $request->asunto;
        $for = "ctamayo@yavirac.edu.ec";
        Mail::send('notificacion', array('notificacion' => $notificacion), function ($msj) use ($subject, $for) {
            $msj->subject($subject);
            $msj->to($for);
        });
    }

}