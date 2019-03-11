<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCarrerasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carreras', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('instituto_id');
            $table->foreign('instituto_id')->references('id')->on('institutos');
            $table->string('codigo',50);
            $table->string('codigo_sniese',50);
            $table->string('nombre',50);
            $table->string('descripcion',50);
            $table->string('modalidad',50);
            $table->string('numero_resolucion',50);
            $table->string('titulo_otorga',50);
            $table->string('siglas',50);
            $table->string('tipo_carrera',50);
            $table->string('estado',20)->default('ACTIVO');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('carreras');
    }
}
