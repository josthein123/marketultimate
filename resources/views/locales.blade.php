@extends('layouts.app')

@section('content')
<br><br>
<div class="page-blog bg--white section-padding--lg blog-sidebar right-sidebar">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="blog-page">
                    <div class="page__header">
                        <h1>Nuestros locales</h1>
                    </div>

                    @forelse($sucursal as $suc)

                    <!-- Start Single Post -->
                    <article class="blog__post d-flex flex-wrap">
                        <div class="thumb">
                            <a href="#suc">
                                @if($suc->imagen == '')
                                <img src="{{url('local_predeterminado.png')}}" alt="blog images" height ="300px">
                                @else
                                <img src="{{ asset('storage/'.$suc->imagen.'')}}" alt="blog images" height ="300px">
                                @endif
                            </a>
                        </div>
                        <div class="content"><br><br><br><br><br>
                            <h3><a href="#nice">SUCURSAL {{$suc->nombre}}</a></h3>
                            <ul class="post__meta">
                                <li>Direccion : <a href="#">{{$suc->direccion}}</a></li>
                                <li class="post_separator">/</li>
                                <li>{{$suc->departamento}} - {{$suc->distrito}}</li>
                            </ul>
                            @if($suc->correo != '')
                                <p>Correo : {{$suc->correo}}</p>
                                @endif

                                @if($suc->telefono != '')
                                <p>Telefono : {{$suc->telefono}}</p>
                                @endif
                            <!--<p>Asesores de venta:</p>-->

                        </div>
                    </article>

                    <!-- End Single Post -->
                    @empty

                    <article class="blog__post d-flex flex-wrap">
                        <div style="color:red"> no hay sucursales activos</div>
                    </article>

                    @endforelse

                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
@endsection
