@extends('layouts.app')

<!--PPRINCIPAL-->
<!--PPRINCIPAL-->
<!--PPRINCIPAL-->
@section('content')
<br>
<section class="page-shop-sidebar left--sidebar bg--white section-padding--lg" id="so">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                            <div class="shop__list nav justify-content-center" role="tablist">

                                <a class="nav-item nav-link active" id="nav_grid" data-toggle="tab" href="#nav-grid-Todos" role="tab">
                                    <i class="fa fa-th"></i>
                                </a>
                                <a class="nav-item nav-link" id="nav_list" data-toggle="tab" href="#nav-list-Todos"  role="tab">
                                    <i class="fa fa-list"></i>
                                </a>

                            </div>
                            <p>{{ isset($oferta) ? count($oferta):'0'}} resultado(s)</p>
                            <div class="orderby__wrapper">
                                <span>CATEGORIA</span>
                                <select class="shot__byselect" id="filtro">
                                    <option>Todos</option>
                                    @if(isset($cat) && count($cat) > 0)
                                    @foreach($cat as $cate)
                                    <option value="{{$cate->id_cat}}">{{$cate->nombre}}</option>
                                    @endforeach
                                    @endif

                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!--GRILLA-->
                <div class="tab__container">

                <input type="hidden" id="valor" value="1">

                    <!--TODOS-->
                    <div class="shop-grid tab-pane fade show active" id="nav-grid-Todos" role="tabpanel">
                        <div class="row">

                            @if(isset($oferta))
                            @if(count($oferta) > 0)
                            @foreach($oferta as $of)
                            <!-- Start Single Product -->
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="product">
                                    <div class="product__thumb">
                                        <a class="first__img" href="{{ url('ver-prod/'.$of->id_prod.'') }}"><img src="{{ asset('storage/'.$of->imagen.'')}}" height="300px"></a>
                                        <div class="new__box">
                                            <span class="new-label">OFERTA</span>
                                        </div>
                                        <ul class="prize position__right__bottom d-flex">
                                        @if($of->descuento > 0)
                                        <li class="old_prize">S/. {{$of->precio}}</li>
                                        <li >S/. {{ number_format( $of->precio -($of->precio * ($of->descuento / 100)),2, '.', ' ' ) }}</li>
                                        @else
                                        <li>S/. {{$of->precio}}</li>
                                        @endif
                                        </ul>

                                    </div>
                                    <div class="product__content">
                                        <h4><a href="single-product.html">{{$of->nombre}}</a></h4>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                            @endforeach
                            @endif
                            @else
                                ninguna oferta por el momento
                            @endif
                        </div>
                    </div>


                    <div class="shop-grid tab-pane fade" id="nav-list-Todos" role="tabpanel">
                        <div class="list__view__wrapper">

                            @if(isset($oferta) && count($oferta) > 0)
                            @foreach($oferta as $of)
                            <!-- Start Single Product -->
                            <div class="list__view">
                                <div class="thumb">
                                    <a class="first__img" href="{{ url('ver-prod/'.$of->id_prod.'') }}"><img src="{{ asset('storage/'.$of->imagen.'')}}" height="300px"></a>
                                </div>
                                <div class="content">
                                    <h2><a href="{{ url('ver-prod/'.$of->id_prod.'') }}">{{$of->nombre}}</a></h2>
                                    <ul class="prize__box">
                                        @if($of->descuento > 0)
                                        <li class="old__prize">S/. {{$of->precio}} </li>&nbsp;&nbsp;
                                        <li > S/. {{ number_format( $of->precio -($of->precio * ($of->descuento / 100)),2, '.', ' ' ) }}</li>
                                        @else
                                        <li>S/. {{$of->precio}}</li>
                                        @endif
                                    </ul>
                                    <ul>
                                    @if(isset($carac) && count($carac) > 0)
                                        @foreach($carac as $cc)
                                            @if($of->id_prod == $cc->id_prod)
                                                <li>- {{$cc->caracteristica}}</li>
                                            @endif

                                        @endforeach
                                    @endif
                                    </ul>
                                    <p></p>
                                    <ul class="cart__action d-flex">
                                        @auth
                                        <li class="cart"><a href="#agregado" class="so" data="{{$of->id_prod}}">Agregar al carrito</a></li>
                                        @else
                                        <li class="cart"><a href="{{ url('login') }}" class="so" data="{{$of->id_prod}}">Agregar al carrito</a></li>
                                        @endauth
                                    </ul>

                                </div>
                            </div><br><br>
                            <!-- End Single Product -->
                            @endforeach
                            @else
                                ninguna oferta por el momento
                            @endif
                        </div>
                    </div>
                    <!--END TODOS-->


                    <!--CAT-->
                    @if(isset($cat) && count($cat) > 0)
                    @foreach($cat as $c_gen)

                    <div class="shop-grid tab-pane fade" id="nav-grid-{{ str_replace(' ', '',$c_gen->nombre)}}" role="tabpanel">
                        <div class="row" id="list_grid">

                            @if(isset($oferta) && count($oferta) > 0)
                            @foreach($oferta as $of)
                                @if($c_gen->id_cat == $of->id_cat)
                            <!-- Start Single Product -->
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="product">
                                    <div class="product__thumb">
                                        <a class="first__img" href="{{ url('ver-prod/'.$of->id_prod.'') }}"><img src="{{ asset('storage/'.$of->imagen.'')}}" height="300px"></a>
                                        <div class="new__box">
                                            <span class="new-label">OFERTA</span>
                                        </div>
                                        <ul class="prize position__right__bottom d-flex">
                                        @if($of->descuento > 0)
                                        <li class="old_prize">S/. {{$of->precio}}</li>
                                        <li >S/. {{ number_format( $of->precio -($of->precio * ($of->descuento / 100)),2, '.', ' ' ) }}</li>
                                        @else
                                        <li>S/. {{$of->precio}}</li>
                                        @endif
                                        </ul>

                                    </div>
                                    <div class="product__content">
                                        <h4><a href="{{ url('ver-prod/'.$of->id_prod.'') }}">{{$of->nombre}}</a></h4>
                                    </div>
                                </div>
                            </div>
                                @endif

                            @endforeach
                                <!-- End Single Product -->
                            @else
                                ninguna oferta por el momento
                            @endif
                                <!-- End CAT -->
                        </div>
                    </div>


                    <div class="shop-grid tab-pane fade" id="nav-list-{{ str_replace(' ', '',$c_gen->nombre) }}" role="tabpanel">
                        <div class="list__view__wrapper">

                            @if(isset($oferta) && count($oferta) > 0)
                            @foreach($oferta as $of)
                                @if($c_gen->id_cat == $of->id_cat)
                            <!-- Start Single Product -->
                            <div class="list__view">
                                <div class="thumb">
                                    <a class="first__img" href="{{ url('ver-prod/'.$of->id_prod.'') }}"><img src="{{ asset('storage/'.$of->imagen.'')}}" height="300px"></a>
                                </div>
                                <div class="content">
                                    <h2><a href="{{ url('ver-prod/'.$of->id_prod.'') }}">{{$of->nombre}}</a></h2>
                                    <ul class="prize__box">
                                        @if($of->descuento > 0)
                                        <li class="old__prize">S/. {{$of->precio}} </li>&nbsp;&nbsp;
                                        <li > S/. {{ number_format( $of->precio -($of->precio * ($of->descuento / 100)),2, '.', ' ' ) }}</li>
                                        @else
                                        <li>S/. {{$of->precio}}</li>
                                        @endif
                                    </ul>
                                    <ul>
                                    @if(isset($carac) && count($carac) > 0)
                                        @foreach($carac as $cc)
                                            @if($of->id_prod == $cc->id_prod)
                                                <li>- {{$cc->caracteristica}}</li>
                                            @endif

                                        @endforeach
                                    @endif
                                    </ul>
                                    <p></p>
                                    <ul class="cart__action d-flex">
                                        @auth
                                        <li class="cart"><a href="#agregado" class="so" data="{{$of->id_prod}}">Agregar al carrito</a></li>
                                        @else
                                        <li class="cart"><a href="{{ url('login') }}" class="so" data="{{$of->id_prod}}">Agregar al carrito</a></li>
                                        @endauth
                                    </ul>

                                </div>
                            </div><br><br>
                            <!-- End Single Product -->
                                @endif
                            @endforeach
                            @else
                                ninguna oferta por el momento
                            @endif
                        </div>
                    </div>
                    <!---->
                    @endforeach
                    @endif


                </div>
            </div>
        </div>
    </div>
</section>

@endsection
