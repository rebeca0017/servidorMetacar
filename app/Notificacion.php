<?php
/**
 * Created by PhpStorm.
 * User: cesar
 * Date: 22/3/2019
 * Time: 16:16
 */

namespace App;


class Notificacion
{
    public $asunto;
    public $carrera = '';
    public $body = '';
    public $user = '';

    public function __construct($asunto, $carrera, $body, $user)
    {
        $this->asunto = $asunto;
        $this->carrera = $carrera;
        $this->body = $body;
        $this->user = $user;
    }
}
