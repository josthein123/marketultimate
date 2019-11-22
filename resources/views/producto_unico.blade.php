@extends('layouts.app')

<!--PARTE PRINCIPAL-->
<!--PARTE PRINCIPAL-->
<!--PARTE PRINCIPAL-->

@section('content')
<!-- Start main Content -->
<br>
<br>
<br>
<div class="maincontent bg--white pt--80 pb--55">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-12">
                <div class="wn__single__product "  >
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <div class="wn__fotorama__wrapper">
                                <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                        <a href="{{ asset('storage/'.$producto->imagen.'')}}"><img src="{{ asset('storage/'.$producto->imagen.'')}}"></a>
                                        @if(isset($prod_gal) && count($prod_gal)>0)
                                            @foreach($prod_gal as $vp_pg)
                                            <a href="{{ asset('storage/'.$vp_pg->imagen.'')}}"><img src="{{ asset('storage/'.$vp_pg->imagen.'')}}"></a>
                                            @endforeach
                                        @endif
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12" >
                            <div class="product__info__main" id="so">
                                <input type="hidden" id = "id_prod_vu" value="{{$producto->id_prod}}">
                                <br>
                                <h1>{{$producto->nombre}}</h1>
                                <div class="product-info-stock-sku d-flex">
                                    <p>Disponible:<span id="barra_stock"> {{$producto->stock}} en stock</span></p>
                                    <p>Codigo:<span> {{$producto->cod_producto}}</span></p>
                                </div>
                                <div class="price-box">

                                    <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                                        <div class="description__attribute">
                                            <ul>
                                            @if($producto->descuento > 0)
                                                <label class="old_prize" style ="text-decoration:line-through;">
                                                <h4>S/. {{$producto->precio}}</h4></label>&nbsp;&nbsp;
                                                <label style="color:#ce7852" ><h3>S/. {{ number_format( $producto->precio -($producto->precio * ($producto->descuento / 100)),2, '.', ' ' ) }}</h3></label>
                                            @else
                                                <label >S/. {{$producto->precio}}</label>
                                            @endif
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="box-tocart d-flex" id="table_car">
                                    <span>Cantidad</span>
                                    <input id="vp_cantidad{{$producto->id_prod}}" class="input-text qty" name="vp_cantidad" min="1"  value="1" title="" type="text" readonly>
                                    <aside class="wedget__categories poroduct--tag"  >
                                        <ul>
                                            <li><a class="btn btn-mas" data = "{{$producto->id_prod}}" href="#mm" style="margin: 0px 5px 0 0;">+</a></li>
                                        </ul>
                                    </aside>
                                    <aside class="wedget__categories poroduct--tag">
                                        <ul>
                                            <li><a class="btn btn-menos" data = "{{$producto->id_prod}}" href="#rr" style="margin: 0px 5px 0 0;">-</a></li>
                                        </ul>
                                    </aside>
                                </div>

                                <div class="box-tocart d-flex" >
                                    <div class="addtocart__actions" >
                                        @auth
                                        <button class="tocart so" data="{{$producto->id_prod}}" type="button" title="Agregar al carrito">Añadir al carrito</button>
                                        @else
                                        <a href="{{ url('login') }}"><button class="tocart " type="button" title="Inicie sesion" >Añadir al carrito</button></a>
                                        @endauth

                                    </div>
                                </div>

                                <div class="product__overview">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product__info__detailed">
                    <div class="pro_details_nav nav justify-content-start" role="tablist">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details" role="tab">Caracteristica(s)</a>
                    </div>
                    <div class="tab__container">
                        <!-- Start Single Tab Content -->
                        <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                            <div class="description__attribute">
                                <ul>
                                    @if(isset($carac) && count($carac)>0)
                                        @foreach($carac as $vp_carac)
                                        <li>• {{$vp_carac->caracteristica}}.</li>
                                        @endforeach
                                    @else
                                    <li>• No tiene detalles.</li>
                                    @endif

                                </ul>
                            </div>
                        </div>
                        <!-- End Single Tab Content -->

                    </div>
                </div>

                @if(isset($prod_r) && count($prod_r) > 0)
                <div class="wn__related__product pt--80 pb--50">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">PRODUCTOS RELACIONADOS</h2>
                    </div>
                    <div class="row mt--60" >
                        <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme" >
                            <!-- Start Single Product -->
                            @foreach($prod_r as $vp_pr)
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12" >
                                <div class="product" >
                                    <div class="product__thumb" >
                                        <a class="first__img" href="{{ url('ver-prod/'.$vp_pr->id_prod.'') }}" ><img src="{{ asset('storage/'.$vp_pr->imagen.'')}}" alt="product image" height="290px"></a>

                                        <ul class="prize position__right__bottom d-flex">

                                            @if($vp_pr->descuento > 0)
                                            <li class="old_prize" style ="text-decoration:line-through;">S/. {{$vp_pr->precio}}</li>
                                            <li  >S/. {{ number_format( $vp_pr->precio -($vp_pr->precio * ($vp_pr->descuento / 100)),2, '.', ' ' ) }}</li>
                                            @else
                                            <li >S/. {{$vp_pr->precio}}</li>
                                            @endif
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart" href="cart.html"></a></li>
                                                    <li><a class="wishlist" href="wishlist.html"></a></li>
                                                    <li><a class="compare" href="compare.html"></a></li>
                                                    <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal"></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product__content">
                                        <h4><a href="{{ url('ver-prod/'.$vp_pr->id_prod.'') }}">{{$vp_pr->nombre}}</a></h4>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            <!-- Start Single Product -->
                        </div>
                    </div>
                </div>
                <input type="hidden" id="vp_stock{{$producto->id_prod}}" value="{{$producto->stock}}">
                @endif


            </div>
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40" style="background:#F7F7F7">
                <div class="shop__sidebar">
                    <aside class="wedget__categories poroduct--cat">
                        <br>
                        <h3 class="wedget__title">CATEGORÍAS</h3>
                        <ul>
                            @foreach($cat as $vp_cat)
                            <li><a href="{{ url('/ver-prod-cat/'.$vp_cat->id_cat.'')}}">{{$vp_cat->nombre}} <span></span></a></li>
                            @endforeach

                        </ul>
                    </aside>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
