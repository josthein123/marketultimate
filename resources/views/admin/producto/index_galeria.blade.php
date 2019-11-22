@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
  <div class="main-content container-fluid">
    <div class="row">

      <div class="col-lg-12">
        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Añadiendo Galeria<span class="card-subtitle">Formulario del producto galeria, aqui puedes añadir mas fotos a tu producto</span></div>
            <div class="card-body">

              @if(Session::has('MensajeGuardar'))
              <div class="alert alert-success alert-dismissible" role="alert">
                  <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button>
                  <div class="icon"><span class="mdi mdi-check"></span></div>
                  <div class="message"><strong>Bien!</strong> {{Session::get('MensajeGuardar')}}</div>
              </div>
              @endif

              @if(Session::has('MensajeEliminar'))
              <div class="alert alert-danger">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button>
                    <div class="icon"><span class="mdi mdi-check"></span></div>
                    <div class="message"><strong>Atencion!</strong> {{Session::get('MensajeEliminar')}}</div>
                </div>
              </div>
              @endif

            <form action="{{ url('producto_galeria') }}" method="POST" enctype="multipart/form-data">
                <!--TOKEN DE SEGURIDAD-->
                {{ csrf_field() }}
                 @include('admin.producto.form_galeria',['Modo'=>'editar'])

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
