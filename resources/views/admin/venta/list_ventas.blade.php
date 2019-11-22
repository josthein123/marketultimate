@extends('layouts.app')

@section('content')
<br> <br>
<section class="wn__faq__area bg--white pt--80 pb--60">
	<div class="container">
        <div class="row">
            <div class="col-lg-12">

            <div class="wn__accordeion__content">
                <h1>Mis compras realizadas en linea</h1><br>
                <!--<select class="shot__byselect" id="filtro">
                    <option>Todos</option>
                    <option value="">asdas</option>
                    <option value="">dddddds</option>

                </select>-->
                <div class="row" style="background:#ce7852;color:white">
                    <div class="col-lg-3">
                        <label id="">Desde</label>
                        <input readonly id="fecha_desde" type="text" class="form-control" name="fecha_desde" required><br>
                    </div>

                    <div class="col-lg-3">
                    <label id="">Hasta</label>
                        <input readonly id="fecha_hasta" type="text" class="form-control" name="fecha_hasta" required><br>
                    </div>
                </div>

            </div>

            <div id="accordion" class="wn_accordion" role="tablist">
            @if(isset($ventas) && count($ventas) > 0)

                @foreach($ventas as $ven)
                <div class="card" >
                    <div class="acc-header" role="tab" id="headingTwo">
                        <h5>
                            <input type="hidden" id="valor{{$ven->id_venta}}" value="0">
                            <a  class="collapsed" data-toggle="collapse" href="#collapse{{$ven->id_venta}}" role="button"
                                aria-expanded="false" aria-controls="collapseTwo" data="{{$ven->id_venta}}-{{$ven->tasa_ac}}">
                                <div>
                                    <table>
                                        <tr>
                                            <th>{{$ven->updated_at}}</th>
                                            <th style="color:green;">$ {{ number_format( $ven->total_dolar + ($ven->costo_envio / $ven->tasa_ac) ,2, '.', ' ' )}}</th>
                                        </tr>
                                    </table>
                                </div>
                            </a>
                        </h5>
                    </div>
                    <div id="collapse{{$ven->id_venta}}" class="collapse" role="tabpanel" aria-labelledby="headingTwo"
                        data-parent="#accordion">
                        <div class="card-body" >
                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th >#</th>
                                            <th class="product-thumbnail">Imagen</th>
                                            <th >Producto</th>
                                            <th >Precio</th>
                                            <th >Cantidad</th>
                                            <th >T. Soles</th>
                                            <th >T. Dolares</th>
                                        </tr>
                                    </thead>

                                    <tbody id="rowacordion{{$ven->id_venta}}">

                                    </tbody>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td colspan="1" >Costo de Envio : </td>
                                        <td colspan="1" style="color:green;"> $ {{ number_format( $ven->costo_envio / $ven->tasa_ac ,2, '.', ' ' )}}</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="background:#EDEDEE">{{ $ven->tipo_entrega == 0 ? 'Recoges en :' : 'Te lo llevanos en :'}}</td>
                                        <td colspan="5">{{$ven->direccion}}</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="background:#EDEDEE">¿Quién Recibe?</td>
                                        <td colspan="2">{{$ven->recepcion}}</td>
                                        <td colspan="2" style="background:#EDEDEE">Fecha </td>
                                        <td colspan="1">{{$ven->fecha_envio}}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td colspan="1" >ESTADO : </td>
                                        <td colspan="1" >{{$ven->estado_recepcion == '' ? '-': $ven->estado_recepcion}}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @else
                <p style="color:red"> Ninguna compra realizada</p>
            @endif
            </div>

            </div>
        </div>
    </div>
</section>
<br><br><br><br><br><br><br><br><br>

@endsection
