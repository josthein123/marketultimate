@extends('layouts.app')

@section('content')
<!-- cart-main-area start -->
<br><br><br>
<div class="cart-main-area section-padding--lg bg--white">
    <div class="container">
    <h2>Carrito de Compras </h2><br>

    <form method="POST" action="{{ url('venta') }}">
        @csrf
        {{ csrf_field() }}
            <div class="row">
                <div class="col-md-12 col-sm-12 ol-lg-12">
                    <div class="table-content wnro__table table-responsive">
                        <table>
                            <thead>
                                <tr class="title-top">
                                    <th class="">Imagen</th>
                                    <th class="">Producto</th>
                                    <th class="">Precio</th>
                                    <th class="">Cantidad</th>
                                    <th class="">Total</th>
                                    <th >Opcion</th>
                                </tr>
                            </thead>
                            <tbody id="so">

                                @forelse($micarro as $cars)
                                <tr class="table_tr{{$cars->id}}" >
                                    <!--<input type="hidden" id = "id_prod_vu" value="{{$cars->id_prod}}">-->
                                    <input type="hidden" id="vp_stock{{$cars->id_prod}}" value="{{$cars->stock + $cars->cant}}">

                                    <td class="product-thumbnail"><a href="#"><img src="{{ asset('storage/'.$cars->imagen.'')}}" alt="product img" height="100px"></a></td>
                                    <td class="product-name">{{$cars->nombre}}</td>
                                    <td class="product-price"><span class="amount">S/. {{$cars->subt == 0 ? $cars->descuento : number_format( $cars->precio -($cars->precio * ($cars->descuento / 100)),2, '.', ' ' )}}</span></td>
                                    <td class="product-quantity">

                                    <div class="box-tocart d-flex" >
                                        <input id="vp_cantidad{{$cars->id_prod}}" class="input-text qty" name="vp_cantidad{{$cars->id_prod}}" min="1"  value="{{$cars->cant}}" title="" type="text" readonly >
                                        <aside class="wedget__categories poroduct--tag"  style="margin-left:3px">
                                            <ul>
                                                <li><a class="btn btn-mas" data="{{$cars->id_prod}}" href="#mm" style="margin: 0px 5px 0 0;">+</a></li>
                                            </ul>
                                        </aside>
                                        <aside class="wedget__categories poroduct--tag">
                                            <ul>
                                                <li><a class="btn btn-menos" data="{{$cars->id_prod}}" href="#rr" style="margin: 0px 5px 0 0;">-</a></li>
                                            </ul>
                                        </aside>
                                    </div>

                                    </td>
                                    <td class="product-subtotal{{$cars->id}}">S/. {{ number_format( $cars->subt,2, '.', ' ' )}}</td>
                                    <td >
                                        <ul>
                                            <li title="¿actualizar?" style="font-size:x-large"><a href="#save" style="margin: 0px 5px 0 0;"><i class="zmdi zmdi-save" data ="{{$cars->id}}-{{$cars->id_prod}}" ></a></i></li>
                                            <li title="eliminar?" style="font-size:x-large"><a href="#delete" style="margin: 0px 5px 0 0;"><i class="zmdi zmdi-delete" data ="{{$cars->id}}-{{$cars->id_prod}}"></i></a></li>
                                        </ul>
                                    </td>
                                </tr>
                                @empty
                                    <tr >
                                    <td colspan="6" style="color:red"> TU CARRITO ESTA VACIA</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                @if(count($micarro) > 0)
                <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8" id="box_despacho">
                    <div class="my__account__wrapper"><br>

                            <div class="account__form">
                                <div class="input__box">
                                    <label>Típo de Entrega <span>*</span></label>
                                    <select id="tipo_entrega"class="form-control" name="tipo_entrega"  required>
                                        <option value="" disabled selected> SELECCIONE</option>
                                        <option value="0" > Retirar mi compra</option>
                                        <option value="1" > Despacho a domicilio</option>
                                    </select>
                                    @if( $errors->has('tipo_entrega') )
                                        <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('tipo_entrega') }}</li></ul>
                                    @endif
                                </div>

                                <div class="input__box" id="div_direccion">

                                </div>

                                <div class="input__box">
                                    <label id="mns_entrega">¿Cuándo lo llevamos?<span>*</span></label>
                                    <input readonly id="fecha_envio" type="text" class="form-control is-invalid " name="fecha_envio" required>
                                    @if( $errors->has('fecha_envio') )
                                        <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('fecha_envio') }}</li></ul>
                                    @endif
                                </div>

                                <div class="input__box" id="div_recogera">

                                </div>

                                <div class="input__box">
                                    <label>¿Quién recibira/recogerá la orden?<span> indicar Nombre completo y DNI de la persona</span></label>
                                    <input id="recepcion" placeholder="ejm: mi hermana mayor Ema 77777777" type="text" class="form-control is-invalid " name="recepcion" required maxlength="250">
                                    @if( $errors->has('recepcion') )
                                        <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('recepcion') }}</li></ul>
                                    @endif
                                </div>

                            </div>
                        </form>
                    </div>
                </div>


                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="cartbox__total__area">
                        <div class="cartbox-total d-flex justify-content-between">
                            <ul class="cart__total__list">
                                <li>Sub Total</li>
                                <li>Igv</li>
                                <li>Descuento</li>

                                <li>Envío <strong style="color:red" title="Costo de envio a su domicilio" >?</strong></li>

                            </ul>
                            <ul class="cart__total__tk">
                                <li class="car_sub">{{ isset($totales[0]->subtotal) ? number_format($totales[0]->subtotal,2, '.', ' ' ) : '0.00' }}</li>
                                <li class="car_igv">{{ isset($totales[0]->igv) ? number_format($totales[0]->igv,2, '.', ' ' ) : '0.00' }}</li>
                                <li class="car_desc">{{ isset($totales[0]->descuento) ? number_format($totales[0]->descuento,2, '.', ' ' ) : '0.00' }}</li>

                                <li class="car_adicional">0.00</li>

                            </ul>
                        </div>
                        <input type="hidden" id="car_total_hidden" value ="{{ isset($totales[0]->total) ? number_format($totales[0]->total,2, '.', ' ' ) : '0.00' }}">
                        <div  class="cart__total__amount" >
                            <span >Total SOLES</span>
                            <span class="car_total">S/ {{ isset($totales[0]->total) ? number_format($totales[0]->total,2, '.', ' ' ) : '0.00' }}</span>

                        </div>
                        <div  class="cart__total__amount" >
                            <span >Total DOLARES</span>
                            <span class="car_total_dolar">$ {{ isset($totales[0]->total) ? number_format($totales[0]->total / $tasa,2, '.', ' ' ) : '0.00' }}</span>

                        </div>
                        <label for="">tasa de cambio : <strong class="car_tasa">{{$tasa}}</strong></label>

                        <button onClick="this.form.submit(); this.disabled=true; this.value='Sending…'; " type="submit" style="background-color: green;border: none;color: white;padding: 15px 45%; text-align: right;text-decoration: none;font-size: 16px;margin: 4px 2px;  cursor: pointer;"><strong>PAGAR</strong></button>

                    </div>
                </div>
                @endif

            </div>
        </form>
    </div>
</div>

@endsection

<!-- cart-main-area end -->
