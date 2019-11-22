@extends('layouts.app_super_admin')

@section('content')

<div class="be-content">
    <div class="main-content container-fluid">
        <div class="row">
            <div class="col-sm-12">

              <div class="card card-table">

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

                <div class="card-header">Lista de tus Sub Categorias

                  <div class="tools dropdown">
                    <a href="{{ url('subcategoria')}}"><span class="icon mdi mdi-playlist-plus">Nuevo</span></a>
                    <!--<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                        <span class="icon mdi mdi-more-vert"></span>
                      </a>
                      <div class="dropdown-menu" role="menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                          <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                      </div>-->
                  </div>

                </div>
                <div class="card-body">
                  <table class="table table-striped table-hover table-fw-widget" id="table4">
                    <thead>
                      <tr class="gradeA">
                        <th>#</th>
                        <th>Categoria</th>
                        <th>Sub Categoria</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody id="tb_datos">

                    @if(count($subcategorias) > 0)
                        @foreach($subcategorias as $subcat)
                        <tr class="odd gradeX">
                            <td>{{$loop->iteration}}</td>
                            <td>{{ $subcat->namecat}}</td>
                            <td>{{ $subcat->nombre}}</td>
                            <td>{{ $subcat->descripcion == "" ? "-":$subcat->descripcion}}</td>
                            @if($subcat->estado == 1)
                            <td class="center"><button class="btn btn-rounded btn-space btn-success">ACTIVO</button></td>
                            @else
                            <td class="center"><button class="btn btn-rounded btn-space btn-danger">INACTIVO</button></td>
                            @endif
                            <td class="actions">
                                <a href="{{ url('subcategoria/'.$subcat->id_subcat.'/edit') }}"><button class="btn btn-space btn-warning btn-sm"><i style="color:white" class="icon icon-left mdi mdi-edit"></i></button></a>
                                <!--<button type="button" class="btn btn-space btn-danger btn-sm delete" id="swal-col-danger" data="{{$subcat->id_subcat}}" ><i style="color:white"class="icon icon-left mdi mdi-delete" ></i></button>-->
                            </td>

                        </tr>
                        @endforeach
                    @else
                    <tr class="odd gradeX">
                    <td colspan="7" class="center">No hay data</td>
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

<script>
  $('#tb_datos').on('click', '.delete', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('subcategoria/${id}')}}`
    QuestActionModal('subcategoria',url,'list-subcategoria',token)
  });

</script>
@endsection
