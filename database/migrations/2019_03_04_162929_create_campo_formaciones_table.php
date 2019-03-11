<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampoFormacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campo_formaciones', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('nombre', 100);
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
        Schema::dropIfExists('campo_formaciones');
    }
}
