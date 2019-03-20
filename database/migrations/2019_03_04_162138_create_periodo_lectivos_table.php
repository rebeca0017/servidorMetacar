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
            $table->string('codigo', 50);
            $table->string('nombre', 100);
            $table->date('fecha_inicio_periodo');
            $table->date('fecha_fin_periodo');
            $table->date('fecha_inicio_cupo')->nullable();
            $table->date('fecha_fin_cupo')->nullable();
            $table->date('fecha_inicio_ordinaria')->nullable();
            $table->date('fecha_fin_ordinaria')->nullable();
            $table->date('fecha_inicio_extraordinaria')->nullable();
            $table->date('fecha_fin_extraordinaria')->nullable();
            $table->date('fecha_inicio_especial')->nullable();
            $table->date('fecha_fin_especial')->nullable();
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
