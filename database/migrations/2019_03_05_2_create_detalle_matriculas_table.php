<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetalleMatriculasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalle_matriculas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();
            $table->integer('matricula_id')->nullable();
            $table->foreign('matricula_id')->references('id')->on('matriculas')->nullable();
            $table->integer('asignatura_id')->nullable();
            $table->foreign('asignatura_id')->references('id')->on('asignaturas')->nullable();
            $table->integer('tipo_matricula_id')->nullable();
            $table->foreign('tipo_matricula_id')->references('id')->on('tipo_matriculas')->nullable();
            $table->string('paralelo',20)->nullable();
            $table->string('jornada',20)->nullable();
            $table->string('numero_matricula',20);
            $table->string('estado',20)->default('ACTIVO');
            $table->unique(['matricula_id','asignatura_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detalle_matriculas');
    }
}
