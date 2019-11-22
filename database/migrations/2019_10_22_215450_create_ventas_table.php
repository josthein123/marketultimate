<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVentasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ventas', function (Blueprint $table) {
            $table->integer('id_venta')->autoIncrement();
            $table->integer('tipo_entrega');
            $table->string('direccion', 250);
            $table->dateTime('fecha_envio');
            $table->string('recepcion', 250);
            $table->decimal('tasa_ac', 10, 2);
            $table->integer('id_user');
            $table->decimal('total', 10, 2);
            $table->decimal('descuento', 10, 2);
            $table->decimal('total_dolar', 10, 2);
            $table->decimal('costo_envio', 10, 2)->nullable();
            $table->text('code_pago');
            $table->text('paypal_datos');
            $table->tinyInteger('estado')->default('0');
            $table->string('estado_recepcion', '250')->nullable();
            $table->foreign('id_user')->references('id')->on('users');
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
        Schema::dropIfExists('ventas');
    }
}
