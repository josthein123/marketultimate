@extends('layouts.app')


<!--PRINCIPAL-->
<!--PRINCIPAL-->
<!--PRINCIPAL-->
@section('content')
<br><br><br>
<section class="page-shop-sidebar left--sidebar bg--white section-padding--lg " id="so">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                            <div class="shop__list nav justify-content-center" role="tablist">

                                <a class="nav-item nav-link active" id="nav_grid" data-toggle="tab" href="#nav-grid-Todos" role="tab">
                                    <i class="fa fa-th"></i>
                                </a>
                                <a class="nav-item nav-link" id="nav_list" data-toggle="tab" href="#nav-list-Todos" role="tab">
                                    <i class="fa fa-list"></i>
                                </a>

                            </div>
                            <p>{{ isset($pc) ? count($pc):'0'}} resultado(s)</p>
                            <div class="orderby__wrapper">
                                <span>FILTRO</span>
                                <select class="shot__byselect" id="filtro">
                                    <option>Todos</option>
                                    @if(isset($subcat) && count($subcat) > 0)
                                    @foreach($subcat as $scat)
                                    <option value="{{$scat->id_subcat}}">{{$scat->nombre}}</option>
                                    @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="tab__container">

                    <input type="hidden" id="valor" value="1">

                    <!--TODOS-->
                    <div class="shop-grid tab-pane fade show active" id="nav-grid-Todos" role="tabpanel">
                        <div class="row">
                            <!-- Start Single Product -->

                            @if(isset($pc) && count($pc) > 0)
                                @foreach($pc as $vc_p)
                                <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                    <div class="product">
                                        <div class="product__thumb">
                                            <a class="first__img" href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}"><img src="{{ asset('storage/'.$vc_p->imagen.'')}}" height="300px"></a>
                                            <ul class="prize position__right__bottom d-flex">
                                                @if($vc_p->descuento > 0)
                                                <li class="old_prize">S/. {{$vc_p->precio}}</li>
                                                <li >S/. {{ number_format( $vc_p->precio -($vc_p->precio * ($vc_p->descuento / 100)),2, '.', ' ' ) }}</li>
                                                @else
                                                <li>S/. {{$vc_p->precio}}</li>
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
                                            <h4><a href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}">{{$vc_p->nombre}}</a></h4>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            @endif

                            <!-- End Single Product -->
                        </div>
                    </div>


                    <div class="shop-grid tab-pane fade" id="nav-list-Todos" role="tabpanel">
                        <div class="list__view__wrapper">
                            <!-- Start Single Product -->
                            @if(isset($pc) && count($pc) > 0)
                                @foreach($pc as $vc_p)
                                <div class="list__view">
                                    <div class="thumb">
                                        <a class="first__img" href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}"><img src="{{ asset('storage/'.$vc_p->imagen.'')}}" height="300px"></a>
                                    </div>
                                    <div class="content">
                                        <h2><a href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}">{{$vc_p->nombre}}</a></h2>
                                        <ul class="prize__box">
                                                @if($vc_p->descuento > 0)
                                                <li class="old__prize">S/. {{$vc_p->precio}}</li>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <li >S/. {{ number_format( $vc_p->precio -($vc_p->precio * ($vc_p->descuento / 100)),2, '.', ' ' ) }}</li>
                                                @else
                                                <li>S/. {{$vc_p->precio}}</li>
                                                @endif
                                        </ul>
                                        <ul>
                                        @if(isset($carac) && count($carac) > 0)
                                            @foreach($carac as $cc)

                                                @if($vc_p->id_prod == $cc->id_prod)
                                                    <li>- {{$cc->caracteristica}}</li>
                                                @endif

                                            @endforeach
                                        @endif
                                        </ul>

                                        <ul class="cart__action d-flex">
                                            @auth
                                            <li class="cart"><a href="#agregado" class="so" data="{{$vc_p->id_prod}}">Agregar al carrito</a></li>
                                            @else
                                            <li class="cart"><a href=" {{ url('login') }}" class="so" data="{{$vc_p->id_prod}}">Agregar al carrito</a></li>
                                            @endauth
                                        </ul>

                                    </div>
                                </div><br><br>
                                @endforeach
                            @endif
                            <!-- End Single Product -->

                        </div>
                    </div>

                    <!--END TODOS-->

                    <!--POR SUBCATEGORIA-->
                    @if(isset($subcat) && count($subcat) > 0)
                    @foreach($subcat as $sc_gen)

                    <div class="shop-grid tab-pane fade" id="nav-grid-{{ str_replace(' ', '',$sc_gen->nombre) }}" role="tabpanel">
                        <div class="row" id="list_grid">
                            @if(isset($pc) && count($pc) > 0)
                            @foreach($pc as $vc_p)
                                @if($sc_gen->id_subcat == $vc_p->id_subcat)

                                <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                    <div class="product">
                                        <div class="product__thumb">
                                            <a class="first__img" href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}"><img src="{{ asset('storage/'.$vc_p->imagen.'')}}" height="300px"></a>
                                            <ul class="prize position__right__bottom d-flex">
                                                @if($vc_p->descuento > 0)
                                                <li class="old_prize">S/. {{$vc_p->precio}}</li>
                                                <li >S/. {{ number_format( $vc_p->precio -($vc_p->precio * ($vc_p->descuento / 100)),2, '.', ' ' ) }}</li>
                                                @else
                                                <li>S/. {{$vc_p->precio}}</li>
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
                                            <h4><a href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}">{{$vc_p->nombre}}</a></h4>
                                        </div>
                                    </div>
                                </div>

                                @endif

                            @endforeach
                            @else
                                ninguna
                            @endif
                        </div>
                    </div>



                    <div class="shop-grid tab-pane fade" id="nav-list-{{ str_replace(' ', '',$sc_gen->nombre) }}" role="tabpanel">
                        <div class="list__view__wrapper">
                            <!-- Start Single Product -->
                            @if(isset($pc) && count($pc) > 0)
                                @foreach($pc as $vc_p)
                                    @if($sc_gen->id_subcat == $vc_p->id_subcat)
                                <div class="list__view">
                                    <div class="thumb">
                                        <a class="first__img" href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}"><img src="{{ asset('storage/'.$vc_p->imagen.'')}}" height="300px"></a>
                                    </div>
                                    <div class="content">
                                        <h2><a href="{{ url('ver-prod/'.$vc_p->id_prod.'') }}">{{$vc_p->nombre}}</a></h2>
                                        <ul class="prize__box">
                                                @if($vc_p->descuento > 0)
                                                <li class="old__prize">S/. {{$vc_p->precio}}</li>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <li >S/. {{ number_format( $vc_p->precio -($vc_p->precio * ($vc_p->descuento / 100)),2, '.', ' ' ) }}</li>
                                                @else
                                                <li>S/. {{$vc_p->precio}}</li>
                                                @endif
                                        </ul>
                                        <ul>
                                        @if(isset($carac) && count($carac) > 0)
                                            @foreach($carac as $cc)

                                                @if($vc_p->id_prod == $cc->id_prod)
                                                    <li>- {{$cc->caracteristica}}</li>
                                                @endif

                                            @endforeach
                                        @endif
                                        </ul>
                                        <ul class="cart__action d-flex">
                                            @auth
                                            <li class="cart"><a href="#agregado" class="so" data="{{$vc_p->id_prod}}">Agregar al carrito</a></li>
                                            @else
                                            <li class="cart"><a href=" {{ url('login') }}" class="so" data="{{$vc_p->id_prod}}">Agregar al carrito</a></li>
                                            @endauth
                                        </ul>

                                    </div>
                                </div><br><br>
                                    @endif
                                @endforeach
                                @else
                                    ninguna
                                @endif
                            <!-- End Single Product -->

                        </div>
                    </div>

                    @endforeach
                    @endif

                    <!--END SUB CATEGROIA-->
                </div>
            </div>

            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40" style="background:#F7F7F7">
                <div class="shop__sidebar">
                    <aside class="wedget__categories poroduct--cat">
                        <br>
                        <h3 class="wedget__title">CATEGORÍAS</h3>
                        <ul>
                            @foreach($cat as $vc_cat)
                            <li ><a href="{{ url('/ver-prod-cat/'.$vc_cat->id_cat.'')}}"
                                style = "color:{{ $vc_cat->id_cat == $id_categ ? '#ce7852':'' }}"
                            >{{$vc_cat->nombre}} <span></span></a></li>
                            @endforeach
                        </ul>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
