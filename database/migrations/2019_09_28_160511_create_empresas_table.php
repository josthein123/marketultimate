<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmpresasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->integer('id_empresa')->autoIncrement();
            $table->integer('id_tipdoc');
            $table->string('nombre', 250); //->unique();
            $table->string('ruc', 11)->unique();
            $table->string('agno_fiscal', 4);
            $table->string('direccion', 250);
            $table->string('telefono', 9)->nullable();;
            $table->string('departamento', 50);
            $table->string('provincia', 50);
            $table->string('distrito', 50);
            $table->string('correo', 250)->nullable();;
            $table->string('web', 250)->nullable();;
            $table->string('cod_sunat', 20)->nullable();;
            $table->integer('estado');
            $table->timestamps();

            //$table->foreign('id_tipdoc')->references('id_tipdoc')->on('tipo_docs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('empresas');
    }
}
