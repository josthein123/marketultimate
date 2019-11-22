<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubcategoriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subcategorias', function (Blueprint $table) {
            $table->integer('id_subcat')->autoIncrement();
            $table->integer('id_cat');
            $table->string('nombre', 250);
            $table->string('descripcion', 250)->nullable();
            $table->integer('estado');
            $table->timestamps();
            $table->foreign('id_cat')->references('id_cat')->on('categorias');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subcategorias');
    }
}
