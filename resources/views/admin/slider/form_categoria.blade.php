<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
            <label for="inputPassword">Categorias</label>
            <select class="select2 select2-xs" id="id_cat" name="id_cat" readonly>
                <option value="null" selected disabled>Seleccione</option>

                @foreach($categoria as $row)
                <option value="{{ $row->id_cat}}"  >{{ $row->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5 mb-0">
        <div class="form-group">
            <label for="inputPassword">Producto</label>
            <select class="select2 select2-xs" id="id_prod" name="id_prod" readonly>

            </select>
        </div>
        @if( $errors->has('id_prod') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_prod') }}</li></ul>
    @endif
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <label for="inputPassword">&nbsp;</label>
        <p class="text-right">
            <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Añadir ' : 'Modificar ' }}</button>
        </p>
    </div>

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
                                {{$data->created_at}} <a href="#" style="color:red" class="delete_" data="{{$data->id_sc}}"><i class="icon mdi mdi-delete"></i></a>
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

    $("#id_cat").change(function(){
        var cat = $("#id_cat option:selected").val()

        $.ajax({
        type: 'ajax',
        method: 'get',
        url: `{{ url('list_producto_por_cat') }}`,
        data: {cat:cat} ,
        async: 'false',
        dataType: 'json',

        success : data=>{

         var html = ''
            for (var i = 0; i < data.length; i++) {
              html +=`<option value="${data[i].id_prod}" >${data[i].nombre}</option>`
            }
          $('#id_prod').html(html)


        },
        error: data=>{
          alert( "ERROR :cargar productos")
        }
      });
    })


  $('#list_carac').on('click', '.delete_', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('productos-categorizadas/${id}')}}`
    //alert(url)
    QuestActionModal(`de Productos Categorizados ` ,url,`productos-categorizadas`,token)
  });

</script>
