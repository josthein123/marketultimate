@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">

  <div class="main-content container-fluid">
    <div class="row">

      <div class="col-lg-12">

        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Producto<span class="card-subtitle">Formulario del Producto, aqui puedes agregar  tu Producto</span></div>
          <div class="card-body">

            <form action="{{ url('producto') }}" method="POST" enctype="multipart/form-data">
              <!--TOKEN DE SEGURIDAD-->
              {{ csrf_field() }}

              @include('admin.producto.form',['Modo'=>'crear'])
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
