@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
  <div class="main-content container-fluid">
    <div class="row">

      <div class="col-lg-12">
        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Editar Producto<span class="card-subtitle">Formulario del producto, aqui puedes hacer tus modificaciones a tu producto</span></div>
          <div class="card-body">

            <form action="{{ url('producto/'.$row->id_prod) }}" method="POST" enctype="multipart/form-data">
                <!--TOKEN DE SEGURIDAD-->
                {{ csrf_field() }}
                {{ method_field('PUT') }}
                 @include('admin.producto.form',['Modo'=>'editar'])

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
