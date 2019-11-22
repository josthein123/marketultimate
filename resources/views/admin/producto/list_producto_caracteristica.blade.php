@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
    <div class="main-content container-fluid">
        <div class="row">
            <div class="col-sm-12">

              <div class="card card-table">

                <div class="card-header">Lista de tus Productos(Caracteristica)

                </div>
                <div class="card-body">
                  <table class="table table-striped table-hover table-fw-widget" id="table4">
                    <thead>
                      <tr class="gradeA">
                        <th>#</th>
                        <th>Sub Categoria</th>
                        <th>Producto</th>
                        <th>Codigo del producto</th>
                        <th>Marca</th>
                        <th>Caracteristicas</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody id="tb_datos">

                    @if(count($productos) > 0)
                        @foreach($productos as $prod)
                        <tr class="odd gradeX">
                            <td>{{$loop->iteration}}</td>
                            <td>{{ $prod->categoria}}</td>
                            <td>{{ $prod->nombre}}</td>
                            <td>{{ $prod->cod_producto}}</td>
                            <td>{{ $prod->marca}}</td>
                            <td><strong>{{ $prod->total }} caracteristicas</strong></td>
                            <td class="actions">
                                <a href="{{ url('producto_caracteristica/'.$prod->id_prod.'/edit') }}"><button class="btn btn-space btn-warning btn-sm"><i style="color:white" class="icon icon-left mdi mdi-edit"></i></button></a>

                            </td>

                        </tr>
                        @endforeach
                    @else
                    <tr class="odd gradeX">
                    <td colspan="9" class="center">No hay data</td>
                    </tr>
                    @endif

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
        </div>
    </div>
</div>

@endsection
