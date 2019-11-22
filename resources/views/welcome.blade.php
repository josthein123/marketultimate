@extends('layouts.app')

<!--SLIDER PRINCIPAL-->
<!--SLIDER PRINCIPAL-->
<!--SLIDER PRINCIPAL-->
@section('content')
<!-- Start Slider area -->
<div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
    <!-- Start Single Slide
    url('public/storage/'.$sp->imagen.'')
     -->
    @if(count($slider_p) > 0)
        @foreach($slider_p as $sp)
        <div class="slide animation__style10 fullscreen align__center--left"
        style="background-image: url( {{ asset('storage/'.$sp->imagen.'') }} );
        background-repeat: no-repeat;background-size: 55% 89%;background-position: bottom right;background-color:white;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider__content">
                            <div class="contentbox">
                                <h2>Compra <span>tu </span></h2>
                                <h2><span> {{$sp->nombre}} </span></h2>
                                <h2>A <span> S/{{ $sp->descuento !=0 ?
                                number_format( $sp->precio -($sp->precio * ($sp->descuento / 100)),2, '.', ' ' )
                                    :$sp->precio}} </span></h2>
                                <a class="shopbtn" href="{{ url('ver-prod/'.$sp->id_prod.'') }}">Comprar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    @else

    ("Software Como nuevo ! dirijase a super Admin y administra ya tus productos")

    @endif
    <!-- End Single Slide -->
</div>
<!-- End Slider area -->


<!--SLIDER SECUNDARIA-->
<!--SLIDER SECUNDARIA-->
<!--SLIDER SECUNDARIA-->
<!-- Start BEst Seller Area -->
<section class="wn__product__area brown--color pt--80  pb--30" id="so">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2">Ofertas <span class="color--theme">| Mas Vendidos </span></h2>
                    <p>Nuevas ofertas para ti y tu familia, visita nuestra tienda ya, ¡No pierdas tiempo!</p>
                </div>
            </div>
        </div>
        <!-- Start Single Tab Content -->
        <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
            <!-- Start Single Product -->

            @if(count($slider_o) > 0)
                @foreach($slider_o as $so)
                <div class="product product__style--3">

                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">

                        <div class="product__thumb">
                            <a class="first__img" href="{{ url('ver-prod/'.$so->id_prod.'') }}"><img src="{{asset('storage/'.$so->imagen.'')}}" alt="product image" height="280px"></a>
                            <div class="hot__box">
                                <span class="hot-label">
                                    {{$so->etiqueta}}

                                </span>
                            </div>
                        </div>

                        <div class="product__content content--center">
                            <h4><a href="{{ url('ver-prod/'.$so->id_prod.'') }}">{{$so->nombre}}</a></h4>
                                <ul class="prize d-flex">
                                    @if($so->descuento > 0)
                                    <li class="old_prize">S/. {{$so->precio}}</li>
                                    <li >S/. {{ number_format( $so->precio -($so->precio * ($so->descuento / 100)),2, '.', ' ' ) }}</li>
                                    @else
                                    <li>S/. {{$so->precio}}</li>
                                    @endif
                                </ul>
                            <div class="action">
                                <div class="actions_inner">
                                    <ul class="add_to_links">
                                        <li><a class="cart" href="{{ url('ver-prod/'.$so->id_prod.'') }}"><i class="bi bi-shopping-bag4"></i></a>
                                        </li>
                                        <li>
                                            @auth
                                            <a class="wishlist so" data="{{ $so->id_prod }}" href="#agregado" title="agregar al carrito" >
                                                <i class="bi bi-shopping-cart-full"></i>
                                            </a>
                                            @else
                                            <a class="wishlist" href=" {{ url('login') }}" >
                                                <i class="bi bi-shopping-cart-full"></i>
                                            </a>
                                            @endauth
                                        </li>
                                        <!--<li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>-->

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @else
                ("Software Como nuevo ! dirijase a super Admin y administra ya tus productos")
            @endif

        </div>
        <!-- End Single Tab Content -->
    </div>
</section>

<!-- SLIDER CATEGORIZADAS-->
<!-- SLIDER CATEGORIZADAS-->
<!-- SLIDER CATEGORIZADAS-->

<!-- Start Best Seller Area -->
<section class="wn__bestseller__area bg--white pt--80  pb--30" id="sc">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2">Que  <span class="color--theme">| Brindamos</span></h2>
                    <p>Ven rápido y comienza a disfrutar de los beneficios de nuestros productos</p>
                </div>
            </div>
        </div>

        <div class="row mt--50" style="background:#DEDDD9;padding:20px 10px;">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="product__nav nav justify-content-center" role="tablist">
                    @if(count($cat) > 0)
                        <a class="nav-item nav-link active "  data-toggle="tab" href="#nav-all" role="tab">TODOS</a>
                        @foreach($cat as $c)
                        <a class="nav-item nav-link " data-toggle="tab" href="#nav-{{ str_replace(' ', '',$c->nombre)}}" role="tab">{{$c->nombre}}</a>
                        @endforeach
                    @else
                    ("Software Como nuevo ! dirijase a super Admin y administra ya tus categorias")
                    @endif
                </div>
            </div>
        </div>
        <div class="tab__container mt--60">
            <!-- TODOS -->
            @if(count($cat) > 0)
                <div class="row single__tab tab-pane fade show active " id="nav-all" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme ">
                    @if(count($slider_cat) > 0)
                        @foreach($slider_cat as $sc)

                        <div class="single__product">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img" href="{{ url('ver-prod/'.$sc->id_prod.'') }}"><img
                                                src="{{ asset('storage/'.$sc->imagen.'')}}" alt="product image" height="280px"></a>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="single-product.html">{{$sc->nombre}}</a></h4>
                                        <ul class="prize d-flex">
                                            @if($sc->descuento > 0)
                                            <li class="old_prize">S/. {{$sc->precio}}</li>
                                            <li >S/. {{ number_format( $sc->precio -($sc->precio * ($sc->descuento / 100)),2, '.', ' ' ) }}</li>
                                            @else
                                            <li>S/. {{$sc->precio}}</li>
                                            @endif
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart" href="{{ url('ver-prod/'.$sc->id_prod.'') }}"><i
                                                                class="bi bi-shopping-bag4"></i></a></li>
                                                    <li>
                                                        @auth
                                                        <a class="wishlist sc" data="{{ $sc->id_prod}}" href="#agregado" title="agregar al carrito" >
                                                            <i class="bi bi-shopping-cart-full"></i>
                                                        </a>
                                                        @else
                                                        <a class="wishlist" href=" {{ url('login') }}" >
                                                            <i class="bi bi-shopping-cart-full"></i>
                                                        </a>
                                                        @endauth
                                                    </li>
                                                    <!--<li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li>-->

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    @endif
            <!-- End TODOS -->
                    </div>
                </div>



                @foreach($cat as $c)
                    @if(count($slider_cat) > 0)
                    <div class="row single__tab tab-pane fade " id="nav-{{ str_replace(' ', '',$c->nombre) }}" role="tabpanel">
                        <div class="product__indicator--4 arrows_style owl-carousel owl-theme ">
                            @foreach($slider_cat as $sc)

                                @if($c->id_cat == $sc->id_cat)

                                <div class="single__product">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                        <div class="product product__style--3">
                                            <div class="product__thumb">
                                                <a class="first__img" href="{{ url('ver-prod/'.$sc->id_prod.'') }}"><img
                                                        src="{{asset('storage/'.$sc->imagen.'')}}" alt="product image" height="280px"></a>
                                            </div>
                                            <div class="product__content content--center">
                                            <h4><a href="{{ url('ver-prod/'.$sc->id_prod.'') }}">{{$sc->nombre}}</a></h4>
                                                <ul class="prize d-flex">
                                                    @if($sc->descuento > 0)
                                                    <li class="old_prize">S/. {{$sc->precio}}</li>
                                                    <li >S/. {{ number_format( $sc->precio -($sc->precio * ($sc->descuento / 100)),2, '.', ' ' ) }}</li>
                                                    @else
                                                    <li>S/. {{$sc->precio}}</li>
                                                    @endif
                                                </ul>
                                                <div class="action">
                                                    <div class="actions_inner">
                                                        <ul class="add_to_links">
                                                            <li><a class="cart" href="{{ url('ver-prod/'.$sc->id_prod.'') }}"><i class="bi bi-shopping-bag4"></i></a></li>
                                                            <li>
                                                            @auth
                                                            <a class="wishlist sc" data="{{ $sc->id_prod }}" href="#agregado" title="agregar al carrito">
                                                                <i class="bi bi-shopping-cart-full"></i>
                                                            </a>
                                                            @else
                                                            <a class="wishlist" href=" {{ url('login') }}" >
                                                                <i class="bi bi-shopping-cart-full"></i>
                                                            </a>
                                                            @endauth
                                                            </li>
                                                            <!--<li><a class="compare" href="#"><i
                                                                        class="bi bi-heart-beat"></i></a></li>-->

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                @endif

                            @endforeach
                        </div>
                    </div>
                    @endif
                @endforeach
            @endif


        </div>
    </div>

</section>
<!-- Start BEst Seller Area -->
@endsection
