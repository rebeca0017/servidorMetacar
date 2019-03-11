<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMatriculasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matriculas', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('malla_id')->nullable();
            $table->foreign('malla_id')->references('id')->on('mallas')->nullable();
            $table->integer('estudiante_id')->nullable();
            $table->foreign('estudiante_id')->references('id')->on('estudiantes')->nullable();
            $table->integer('periodo_lectivo_id')->nullable();
            $table->foreign('periodo_lectivo_id')->references('id')->on('periodo_lectivos')->nullable();
            $table->integer('periodo_academico_id')->nullable();
            $table->foreign('periodo_academico_id')->references('id')->on('periodo_academicos')->nullable();
            $table->string('codigo', 50);
            $table->date('fecha')->nullable();
            $table->string('folio', 50);
            $table->string('jornada', 50);
            $table->string('paralelo_principal', 50);
            $table->string('codigo_sniese_paralelo', 50);
            $table->string('estado', 20)->default('ACTIVO');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('matriculas');
    }
}
