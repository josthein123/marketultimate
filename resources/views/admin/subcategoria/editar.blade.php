@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
  <div class="main-content container-fluid">
    <div class="row">
    <div class="col-lg-3"> </div>
      <div class="col-lg-6">
        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Editar Sub Categoria<span class="card-subtitle">Formulario de la sub categoria, aqui puedes hacer tus modificaciones a tu sub categoria</span></div>
          <div class="card-body">

            <form action="{{ url('subcategoria/'.$row->id_subcat) }}" method="POST" enctype="multipart/form-data">
                <!--TOKEN DE SEGURIDAD-->
                {{ csrf_field() }}
                {{ method_field('PUT') }}
                 @include('admin.subcategoria.form',['Modo'=>'editar'])

            </form>
          </div>
        </div>
      </div>
      <div class="col-lg-3"> </div>
    </div>
  </div>
</div>
@endsection
