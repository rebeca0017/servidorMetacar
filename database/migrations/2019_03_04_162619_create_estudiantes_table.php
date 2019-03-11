<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEstudiantesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('estudiantes', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('pais_nacionalidad_id')->nullable();
            $table->foreign('pais_nacionalidad_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('pais_residencia_id')->nullable();
            $table->foreign('pais_residencia_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('provincia_residencia_id')->nullable();
            $table->foreign('provincia_residencia_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('canton_residencia_id')->nullable();
            $table->foreign('canton_residencia_id')->references('id')->on('ubicaciones')->nullable();
            $table->string('identificacion', 50);
            $table->string('nombre1', 50);
            $table->string('nombre2', 50);
            $table->string('apellido1', 50);
            $table->string('apellido2', 50);
            $table->date('fecha_nacimiento');
            $table->string('correo_personal', 100);
            $table->string('correo_institucional', 100);
            $table->string('sexo', 50);
            $table->string('etnia', 50);
            $table->string('tipo_sangre', 50);
            $table->string('tipo_identificacion', 50);
            $table->string('tipo_colegio', 50);
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
        Schema::dropIfExists('estudiantes');
    }
}
