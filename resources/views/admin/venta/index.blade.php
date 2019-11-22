@extends('layouts.app')

@section('content')
<!-- cart-main-area start -->
<br><br><br>

<section class="wn__product__area brown--color pt--80  pb--30" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h1 class="title__be--2">Ultimo Paso! </h1>
                    @php
                    $view_venta_soles_final = number_format($v_totales[0]->total + $v_totales[0]->costo_envio,2, '.', ' ' );
                    $view_venta_dolar_final = number_format(($v_totales[0]->total + $v_totales[0]->costo_envio)/$v_totales[0]->tasa_ac,2, '.', ' ' );
                    $view_venta_code_pago = $v_totales[0]->code_pago;
                    $id_venta = $v_totales[0]->id_venta;
                    @endphp
                    <br>
                    <h2>Recuerda que por el envio :  + S/ {{$v_totales[0]->tipo_entrega == 1 ? $v_totales[0]->costo_envio : 0 }}</h2>
                    <h3>Estas apunto de pagar :  </h3>
                    <h1>$ {{    $view_venta_dolar_final   }} por el metodo de pago y seguro de Paypal</h1>
                    <br><br>
                    <p><div id="paypal-button-container"></div></p>
                    <br><br>
                    <form action="{{url('/venta/'.$v_totales[0]->id_venta)}}" method="post">
                        {{csrf_field()}}
                        <!--TIPO DE SOLICITUD-->
                        {{method_field('DELETE')}}
                        <button type="submit"  class="btn btn-danger" onclick="return confirm('¿desea cancelar la compra?')">COMPRAR MAS / RETIRAR</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>

@endsection
