    <!-- Header -->
    <header id="wn__header" class="header__area header__absolute sticky__header" style="background-color:#000000;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                        <div class="logo">
                            <a href="{{ url('')}}">
                                <img src="" class="img_logo">
                            </a>
                        </div>
                    </div>
                    <!--menu-->
                    <div class="col-lg-8 d-none d-lg-block">
                        <nav class="mainmenu__nav">
                            <ul class="meninmenu d-flex justify-content-start">
                                <li class="drop with--one--item"><a href="{{ url('')}} ">Inicio</a></li>
                                <li class="drop"><a href="{{ url('ofertas')}}">OFERTAS</a></li>
                                <li class="drop"><a href="#">PRODUCTOS</a>
                                    <div class="megamenu dropdown">
                                        <ul class="item item01">
                                        @if(isset($cat) && count($cat) > 0)
                                            @foreach($cat as $c_menu)
                                            <li class="label2" ><a href="{{ url('/ver-prod-cat/'.$c_menu->id_cat.'')}}">{{ $c_menu->nombre}}</a>
                                                <ul>
                                            @if(isset($slider_c) && count($slider_c) > 0)
                                                @foreach($slider_c as $prod_menu)

                                                    @if($c_menu->id_cat == $prod_menu->id_cat)
                                                    <li><a href="{{ url('ver-prod/'.$prod_menu->id_prod.'') }}">• {{$prod_menu->nombre}}</a></li>
                                                    @endif

                                                @endforeach
                                            @endif
                                                </ul>
                                            </li>
                                            @endforeach
                                        @endif
                                        </ul>
                                    </div>

                                </li>

                                <li class="drop"><a href="{{ url('locales') }}">LOCALES</a></li>
                                <li class="drop"><a href="{{ url('nosotros') }}">NOSOTROS</a></li>

                            </ul>
                        </nav>
                    </div>
                    <!--endmenu-->


                    <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                        <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                            @if(isset($car))
                            <li class="shop_search"><a class="search__active" href="#"></a></li>
                            <!--<li class="wishlist"><a href="#"></a></li>-->
                                <!--carrito-->
                                @auth
                                <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">{{ count($car) }}</span></a>
                                    <!-- Start Shopping Cart -->
                                    <div class="block-minicart minicart__active">
                                        <div class="minicart-content-wrapper">
                                            <div class="micart__close">
                                                <span>Cerrar</span>
                                            </div>
                                            <div class="items-total d-flex justify-content-between">
                                                <span class="cant_total_carrito">{{ count($car) }} item(s)</span>
                                                <span>Carrito Total</span>
                                            </div>
                                            @php
                                            $total = 0;
                                            @endphp
                                            @foreach($car as $carrito)
                                                @php
                                                $total += $carrito->subt
                                                @endphp
                                            @endforeach

                                            <div class="total_amount text-right">
                                                <span class="total_carrito">S/.
                                                    {{ number_format($total,2, '.', ' ') }}
                                                </span>
                                            </div>
                                            <div class="mini_action checkout">
                                            </div>
                                            <div class="single__items">
                                                <div class="miniproduct">
                                                    <div class="item01 d-flex">
                                                        <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                                        <table class="table table-bordered table-striped mb-0" >
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col" >Imagen</th>
                                                                    <th scope="col" width="920px">Descripcion </th>
                                                                    <th scope="col"></th>
                                                                </tr>
                                                            </thead>

                                                            <tbody id="table_car">
                                                                @if(count($car) > 0)
                                                                @foreach($car as $table_c)
                                                                <tr class="table_tr{{$table_c->id}}">
                                                                    <td>
                                                                        <div class="thumb">
                                                                            <a href="#imagen_car"><img src="{{asset('storage/'.$table_c->imagen.'')}}" height ="90px">
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                    <td width="1">
                                                                        <div class="content ">
                                                                            <h4 id="text-ajuste"><a href="#name_car">{{$table_c->nombre}}</a></h4>
                                                                            <div class="product__content content--center ">
                                                                                @if($table_c->descuento > 0)
                                                                                <li class="old_prize" style ="text-decoration:line-through;">S/. {{$table_c->precio}}</li>
                                                                                <li class="prize" style="color:#ce7852">S/. {{ number_format( $table_c->precio -($table_c->precio * ($table_c->descuento / 100)),2, '.', ' ' ) }}</li>
                                                                                @else
                                                                                <li class="prize" style="color:#ce7852">S/. {{$table_c->precio}}</li>
                                                                                @endif
                                                                                <li class="prize">UN : {{$table_c->cant}} </li>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="content ">
                                                                            <div class="product_prize d-flex justify-content-between">
                                                                                <ul class="d-flex justify-content-end">
                                                                                    <li><a href="#borrado"><i class="zmdi zmdi-delete"  data ="{{$table_c->id}}-{{$table_c->id_prod}}"></i></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                @endforeach
                                                                @else
                                                                <tr>
                                                                    <td colspan="3" align="center"><p style="color:red">Tu carrito esta vacio</p></td>
                                                                </tr>
                                                                @endif
                                                            </tbody>
                                                        </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="mini_action cart">
                                                <a class="cart__btn" href="{{url('carrito')}}">Ver carrito y Pagar</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shopping Cart -->
                                </li>
                                @else
                                <li class="shopcart" title="inicie sesion por favor"><a class="" href="{{ url('login') }}"><span class="product_qun">0</span></a></li>
                                @endauth
                                <!--end carrito-->
                            @endif



                            <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                                <div class="searchbar__content setting__block">
                                    <div class="content-inner">
                                        <div class="switcher-currency">
                                            <strong class="label switcher-label">
                                                <span>Mi cuenta</span>
                                            </strong>
                                            <div class="switcher-options">
                                                <div class="switcher-currency-trigger">
                                                    <div class="setting__menu">
                                                    @auth

                                                        <span><a href="#">{{ Auth::user()->email }}</a></span>
                                                        @if(Auth::user()->id_tipo_usuario == 1)
                                                        <span><a href="{{ url('/super-admin') }}">Administracion</a></span>
                                                        @endif
                                                        <span><a href="{{ url('mis-compras') }}">Mis compras</a></span>
                                                        <span><a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Cerrar Sesion</a>
                                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                                @csrf
                                                        </form>
                                                        </span>
                                                    @else
                                                        <span><a href="{{ route('login') }}">Iniciar Sesion</a></span>
                                                        <span><a href="{{ route('register') }}">Registrarme</a></span>
                                                    @endauth
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>

                <!--Mobile Menu-->
                <div class="row d-none">
                    <div class="col-lg-12 d-none">
                        <nav class="mobilemenu__nav">
                            <ul class="meninmenu">
                                <li><a href="{{ url('')}}">Inicio</a></li>
                                <li><a href="{{ url('ofertas')}}">Ofertas</a>

                                <li><a href="#">Productos</a>
                                    <ul>
                                        @if(isset($cat) && count($cat) > 0)
                                        @foreach($cat as $c_menu)
                                        <li><a href="{{ url('/ver-prod-cat/'.$c_menu->id_cat.'')}}">{{ $c_menu->nombre}}</a>
                                            @if(isset($slider_c) && count($slider_c) > 0)
                                                <ul>
                                                @foreach($slider_c as $prod_menu)
                                                @if($c_menu->id_cat == $prod_menu->id_cat)
                                                <li><a href="{{ url('ver-prod/'.$prod_menu->id_prod.'') }}">{{$prod_menu->nombre}}</a></li>
                                                @endif
                                                @endforeach
                                                </ul>
                                            @endif
                                        </li>
                                        @endforeach

                                        @endif

                                    </ul>
                                </li>

                                <li><a href="{{ url('locales') }}">Locales</a></li>
                                <li><a href="{{ url('nosotros') }}">nosotros</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <!-- End Mobile Menu -->
                <div class="mobile-menu d-block d-lg-none"></div>
            <!-- Mobile Menu -->
            </div>
        </header>
        <!-- //Header -->


        <!-- Start Search Popup -->
        <div class="brown--color box-search-content search_active block-bg close__top">
            <form id="search_mini_form" class="minisearch" action="#">
                <div class="field__search">
                    <input type="text" placeholder="Search entire store here...">
                    <div class="action">
                        <a href="#"><i class="zmdi zmdi-search"></i></a>
                    </div>
                </div>
            </form>
            <div class="close__wrap">
                <span>close</span>
            </div>
        </div>
        <!-- End Search Popup -->

        <!--endhead-->
