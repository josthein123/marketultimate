<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductoGaleriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('producto_galerias', function (Blueprint $table) {
            $table->integer('id_galeria')->autoIncrement();
            $table->integer('id_prod');
            $table->text('imagen');
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
        Schema::dropIfExists('producto_galerias');
    }
}
