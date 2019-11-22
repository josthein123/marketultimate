<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductoCaracteristicasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('producto_caracteristicas', function (Blueprint $table) {
            $table->integer('id_caracteristica')->autoIncrement();
            $table->integer('id_prod');
            $table->string('caracteristica', 250);
            $table->foreign('id_prod')->references('id_prod')->on('productos');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('producto_caracteristicas');
    }
}
