<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
            <label for="inputPassword">Producto</label>
            <select class="select2 select2-xs" id="id_prod" name="id_prod" readonly>
                <option value="{{ $row->id_prod}}" selected >{{ $row->nombre}}</option>
            </select>
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 mb-0">
        <div class="form-group">
            <label for="">Caracteristica</label>
            <div class="input-group input-group-xs mb-2 ">
                <input  class="form-control form-control-xs" type="text" placeholder="Ingrese caracteristica" id="caracteristica" name="caracteristica" autocomplete="off" maxlength ="250" >
                <div class="input-group-prepend">
                    <div class="input-group-append">
                        <button class="btn btn-secondary" id="btn_cant_text" type="button" disabled>0/250</button>
                    </div>
                </div>
            </div>
        </div>
        @if( $errors->has('caracteristica') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('caracteristica') }}</li></ul>
        @endif
    </div>
</div>

<div class="row pt-3">

    <div class="col-sm-12">
        <p class="text-right">
        <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Finalizar' : 'Añadir ' }}</button>
        <a href="{{url('list-producto-caracteristica')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
        </p>
    </div>
</div>

<div class="form-group row " id="data_view">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0" id ="">
        <div class="main-content container-fluid">

        @if(count($caracteristica)> 0)
            <div class="card">
                <div class="card-body">
                <ul class="user-timeline" id="list_carac">
            @foreach($caracteristica as $carac)
                    <li class="{{ $loop->iteration == 1 ? 'latest' : ''  }}">
                        <div class="user-timeline-date">
                            @if(Session::has('now') && $loop->iteration == 1)
                            <strong>{{Session::get('now')}}</strong>
                            @else
                                {{$carac->created_at}} <a href="#" style="color:red" class="delete_" data="{{$carac->id_caracteristica}}"><i class="icon mdi mdi-delete"></i></a>
                            @endif
                        </div>
                      <div class="user-timeline-description"> {{$loop->iteration}} - {{$carac->caracteristica}} </div>
                    </li>

            @endforeach
                </ul>
                </div>
            </div>
        @else
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0" >
            <center>sin ninguna caracteristica</center>
        </div>
        @endif
        </div>
    </div>
</div>

</div>



<script>
    $("#caracteristica").keyup(function(){
        $("#btn_cant_text").text($("#caracteristica").val().length + " /250");
    });

  $('#list_carac').on('click', '.delete_', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('producto_caracteristica/${id}')}}`
    //alert(url)
    QuestActionModal(`Caracteristica ` ,url,`producto_caracteristica/${$("#id_prod").val()}/edit`,token)
  });

</script>
