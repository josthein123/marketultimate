<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSucursalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sucursals', function (Blueprint $table) {
            $table->integer('id_sucursal')->autoIncrement();
            $table->integer('id_empresa')->nullable();
            $table->integer('id_tipdoc')->nullable();
            $table->string('nombre', 250)->nullable();
            $table->string('ruc', 11);
            $table->string('direccion', 250)->nullable();
            $table->string('telefono', 9)->nullable();
            $table->string('departamento', 50);
            $table->string('provincia', 50);
            $table->string('distrito', 50);
            $table->string('correo', 250)->nullable();
            $table->text('imagen')->nullable();
            $table->integer('estado');
            $table->timestamps();

            $table->foreign('id_tipdoc')->references('id_tipdoc')->on('tipo_docs');
            $table->foreign('id_empresa')->references('id_empresa')->on('empresas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sucursals');
    }
}
