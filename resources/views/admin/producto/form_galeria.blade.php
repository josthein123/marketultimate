<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 mb-0">
        <div class="form-group">
            <label for="inputPassword">Producto</label>
            <select class="select2 select2-xs" id="id_prod" name="id_prod" readonly>
                <option value="{{ $row->id_prod}}" selected >{{ $row->nombre}}</option>
            </select>
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
            <label for="inputPassword">Imagen</label>
            <input type="file" id="imagen" name="imagen" class="form-control form-control-xs">
                <!--<div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0" id ="box${nextinput}">
                <div class="col-lg-4">
                    <div class="card text-center"><button type="button" class="btn btn-danger" id="close" Onclick ="eliminar(${nextinput})">x</button>
                        <div class="card-body">
                            <img src="{{ url('public/images/upload.png')}}" width="150px" height="120px" id="imagenmuestra${nextinput}">
                            <input type="file" id="file[]" name="file[]" onChange="preview(this,${nextinput})">
                        </div>
                    </div>
                    </div>

                    </div>-->
        </div>
        @if( $errors->has('imagen') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('imagen') }}</li></ul>
        @endif
    </div>
</div>

<div class="form-group row " id="data_view">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0" id ="">
        <div class="main-content container-fluid">
            <div class="gallery-container" id="view_fotos">
            @if(count($galeria)> 0)

            @foreach($galeria as $gal)
            <div class="item" style="background:#E1E1DF">
                <div class="photo" style="margin-left:10px;margin-right:10px;margin-top:10px;margin-bottom:10px">
                <div class="img"><img src="{{ asset('storage/'.$gal->imagen) }}" alt="Gallery Image"  height="200px">
                    <div class="over">
                    <div class="info-wrapper">
                        <div class="info">
                        <div class="date">{{ $gal->created_at}} </div>
                        <div class="date"></div>
                        <div class="func">
                        <a href="#" class="delete_foto" data="{{$gal->id_galeria}}"><i class="icon mdi mdi-delete"></i></a>
                        <a class="image-zoom" href="{{ asset('storage/'.$gal->imagen) }}">
                            <i class="icon mdi mdi-search"></i>
                        </a>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
            @endforeach

            @else
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0" >
                <center>sin ninguna imagen</center>
            </div>
            @endif
        </div>
    </div>
</div>


</div>

<div class="row pt-3">

<div class="col-sm-12">
    <p class="text-right">
    <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Finalizar' : 'Añadir ' }}</button>
    <a href="{{url('list-producto-galeria')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
    </p>
</div>
</div>

<script>
  $('#view_fotos').on('click', '.delete_foto', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('producto_galeria/${id}')}}`
    //alert(url)
    QuestActionModal(`Imagen ` ,url,`producto_galeria/${$("#id_prod").val()}/edit`,token)
  });

</script>

<!--    SUBIR IMAGEN Y VISUALIZAR
<div class="form-group row " id="view_foto">

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <button class="btn btn-success" type="button" id="btnadd_foto"> + Agregar mas</button>
    </div>

</div>

<div class="row pt-3">

    <div class="col-sm-12">
        <p class="text-right">
        <button class="btn btn-space btn-primary" type="submit">{{ $Modo == 'crear' ? 'Finalizar' : 'Finalizar ' }}</button>
        <a href="{{url('list-producto')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
        </p>
    </div>
</div>

<script>
    nextinput = 0
    $("#btnadd_foto").click(function(){
        campo = `
        <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0" id ="box${nextinput}">
        <div class="col-lg-4">
            <div class="card text-center"><button type="button" class="btn btn-danger" id="close" Onclick ="eliminar(${nextinput})">x</button>
                <div class="card-body">
                    <img src="{{ url('public/images/upload.png')}}" width="150px" height="120px" id="imagenmuestra${nextinput}">
                    <input type="file" id="file[]" name="file[]" onChange="preview(this,${nextinput})">
                </div>
            </div>
            </div>

            </div>
        `
        $("#view_foto").append(campo);
        nextinput++;
    });

    function preview(input,num){
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
            // Asignamos el atributo src a la tag de imagen
            $(`#imagenmuestra${num}`).attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function eliminar(num){

        $(`#box${num}`).remove();
        return false;
    }
</script>
-->
