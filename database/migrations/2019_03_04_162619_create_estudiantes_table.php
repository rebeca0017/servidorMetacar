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
            $table->integer('pueblo_nacionalidad_id')->nullable();
            $table->foreign('pueblo_nacionalidad_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('provincia_nacimiento_id')->nullable();
            $table->foreign('provincia_nacimiento_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('canton_nacimiento_id')->nullable();
            $table->foreign('canton_nacimiento_id')->references('id')->on('ubicaciones')->nullable();
            $table->integer('pais_residencia_id')->nullable();
            $table->foreign('pais_residencia_id')->references('id')->on('ubicaciones')->nullable();
            $table->string('identificacion', 50);
            $table->string('nombre1', 50);
            $table->string('nombre2', 50)->nullable();
            $table->string('apellido1', 50);
            $table->string('apellido2', 50)->nullable();
            $table->date('fecha_nacimiento')->nullable();
            $table->date('fecha_inicio_carrera')->nullable();
            $table->string('correo_personal', 100)->nullable();
            $table->string('correo_institucional', 100)->nullable();
            $table->string('sexo', 50);
            $table->string('etnia', 50);
            $table->string('tipo_sangre', 50)->nullable();
            $table->string('tipo_identificacion', 50);
            $table->string('tipo_colegio', 50)->nullable();
            $table->string('tipo_bachillerato', 50)->nullable();
            $table->string('anio_graduacion')->nullable();
            $table->string('corte')->nullable();
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
