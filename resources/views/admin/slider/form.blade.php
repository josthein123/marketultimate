<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 mb-0">
        <div class="form-group">
            <label for="inputPassword">Producto</label>
            <select class="select2 select2-xs" id="id_prod" name="id_prod" readonly>

                @foreach($producto as $row)
                <option value="{{ $row->id_prod}}"  >{{ $row->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <label for="inputPassword">&nbsp;</label>
        <p class="text-right">
            <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Añadir al inicio' : 'Modificar ' }}</button>
        </p>
    </div>
    @if( $errors->has('id_prod') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_prod') }}</li></ul>
    @endif
</div>

<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0">
        <div class="main-content container-fluid">
            @if(count($datas)> 0)
            <div class="card">
                <div class="card-body">
                <ul class="user-timeline" id="list_carac">

                @foreach($datas as $data)
                    <li class="{{ $loop->iteration == 1 ? 'latest' : ''  }}">
                        <div class="user-timeline-date">
                            @if(Session::has('now') && $loop->iteration == 1)
                            <strong>{{Session::get('now')}}</strong>
                            @else
                                {{$data->created_at}} <a href="#" style="color:red" class="delete_" data="{{$data->id_sp}}"><i class="icon mdi mdi-delete"></i></a>
                            @endif
                        </div>
                      <div class="user-timeline-description"> {{$loop->iteration}} - {{$data->nombre}} </div>
                    </li>
                @endforeach

                </ul>
                </div>
            </div>

            @else
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0" >
                    <center>( nada añadido )</center>
                </div>
            @endif
        </div>

    </div>
</div>

<script>
  $('#list_carac').on('click', '.delete_', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('productos-principales/${id}')}}`
    //alert(url)
    QuestActionModal(`del Producto principal ` ,url,`productos-principales`,token)
  });

</script>
