@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
  <div class="main-content container-fluid">
    <div class="row">

      <div class="col-lg-12">
        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Editar Empresa<span class="card-subtitle">Formulario de la empresa, aqui puedes hacer tus modificaciones a tu empresa</span></div>
          <div class="card-body">

            <form action="{{ url('empresa/'.$row->id_empresa) }}" method="POST" enctype="multipart/form-data">
                <!--TOKEN DE SEGURIDAD-->
                {{ csrf_field() }}
                {{ method_field('PUT') }}
                 @include('admin.empresa.form',['Modo'=>'editar'])

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
