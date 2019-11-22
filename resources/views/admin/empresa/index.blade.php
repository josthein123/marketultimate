@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">

  <div class="main-content container-fluid">
    <div class="row">

      <div class="col-lg-12">

        <div class="card card-border-color card-border-color-primary">
          <div class="card-header card-header-divider">Empresa<span class="card-subtitle">Formulario de la empresa, aqui puedes agregar  tu empresa</span></div>
          <div class="card-body">

            <form action="{{ url('empresa') }}" method="POST" enctype="multipart/form-data">
              <!--TOKEN DE SEGURIDAD-->
              {{ csrf_field() }}

              @include('admin.empresa.form',['Modo'=>'crear'])
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
