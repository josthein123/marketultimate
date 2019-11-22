<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSliderOfertasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('slider_ofertas', function (Blueprint $table) {
            $table->integer('id_so')->autoIncrement();
            $table->integer('id_prod');
            $table->string('etiqueta', 50);
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
        Schema::dropIfExists('slider_ofertas');
    }
}
