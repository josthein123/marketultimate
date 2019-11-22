<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->integer('id_prod')->autoIncrement();
            $table->integer('id_subcat');
            $table->string('cod_producto', 50)->unique();
            $table->integer('id_marca');
            $table->string('nombre', 250);
            $table->text('imagen');
            $table->decimal('descuento', 10, 2)->nullable();
            $table->decimal('precio', 10, 2);
            $table->integer('stock');
            $table->integer('estado');
            $table->string('cod_prod_enc', 250);
            $table->timestamps();

            $table->foreign('id_subcat')->references('id_subcat')->on('subcategorias');
            $table->foreign('id_marca')->references('id_marca')->on('marcas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('productos');
    }
}
