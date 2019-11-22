@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">

  <div class="main-content container-fluid">
    <div class="row">
      <div class="col-lg-3"> </div>
      <div class="col-lg-6">

        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Producto Principales<span class="card-subtitle">Añade los productos que creas que representarian tu negocio y se muestren en la parte del inicio (<a href="{{ url('')}}" target="_blank">ver</a>)</span></div>
          <div class="card-body">
            @if(Session::has('MensajeGuardar'))
              <div class="alert alert-success alert-dismissible" role="alert">
                  <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button>
                  <div class="icon"><span class="mdi mdi-check"></span></div>
                  <div class="message"><strong>Bien!</strong> {{Session::get('MensajeGuardar')}}</div>
              </div>
              @endif
            <form action="{{ url('productos-principales') }}" method="POST" enctype="multipart/form-data">
              <!--TOKEN DE SEGURIDAD-->
              {{ csrf_field() }}

              @include('admin.slider.form',['Modo'=>'crear'])
            </form>

          </div>
        </div>
      </div>
      <div class="col-lg-3"> </div>
    </div>
  </div>
</div>
@endsection
