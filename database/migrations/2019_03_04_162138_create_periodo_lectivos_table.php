<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePeriodoLectivosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('periodo_lectivos', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('nombre', 100);
            $table->date('fecha_inicio');
            $table->date('fecha_fin');
            $table->integer('numero_semanas');
            $table->string('estado', 20)->default('ACTIVO');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('periodo_lectivos');
    }
}
