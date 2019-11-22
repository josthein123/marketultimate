<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="inputPassword">Categorias</label>
            <select class="select2 select2-xs" id="id_cat" name="id_cat" readonly>
                <option value="null" selected disabled>Seleccione</option>

                @foreach($categoria as $cat)
                <option value="{{ $cat->id_cat}}"  >{{ $cat->nombre}}</option>
                @endforeach
        </select>
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="inputPassword">Sub Categoria</label>
        <select class="select2 select2-xs" id="id_subcat" name="id_subcat" >

            @if(isset($row->id_subcat))
            <option value="{{ $data['id_subcat_']}}">{{ $data['nombre_']}}</option>
            @endif

        </select>
            @if( $errors->has('id_subcat') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_subcat') }}</li></ul>
            @endif
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="inputPassword">Marca</label>
        <select class="select2 select2-xs" id="id_marca" name="id_marca" >
                @foreach($marca as $marc)

                    @if(isset($row->id_marca))
                    <option value="{{ $marc->id_marca}}" {{ $row->id_marca == $marc->id_marca ? "selected":""}} >{{ $marc->marca}}</option>
                    @else
                    <option value="{{ $marc->id_marca}}"  >{{ $marc->marca}}</option>
                    @endif

                @endforeach
        </select>
            @if( $errors->has('id_marca') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_marca') }}</li></ul>
            @endif
        </div>
    </div>
<!--onkeypress="return IsNumeric(event);"
onkeyup="mayus(this);"
"-->
    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="">Codigo Producto</label>
            <div class="input-group input-group-xs mb-2 ">
                <input class="form-control form-control-xs" type="text" placeholder="Ingrese codigo producto" id="cod_producto" name="cod_producto" autocomplete="off" value="{{ isset($row->cod_producto) ? $row->cod_producto : '' }}">
            </div>
        </div>
        @if( $errors->has('cod_producto') )
        <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('cod_producto') }}</li></ul>
        @endif
    </div>

</div>
<div class="form-group row ">
    <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 mb-0">
        <div class="form-group">
            <label for="">Nombre de producto</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese nombre de producto" id="nombre" name="nombre" autocomplete="off"  value="{{ isset($row->nombre) ? $row->nombre : '' }}">
        </div>
        @if( $errors->has('nombre') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('nombre') }}</li></ul>
        @endif
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        @if(isset($row->imagen))
        <div class="form-group">
            <label for="">Imagen <a href="{{ asset('storage/'.$row->imagen) }}" target="_blank" >(ver actual)</a></label>
                <input class="form-control form-control-xs" type="file" placeholder="Ingrese imagen" id="imagen" name="imagen" autocomplete="off" >
        </div>
        @else
        <div class="form-group">
            <label for="inputPassword">Imagen</label>
            <input class="form-control form-control-xs" type="file" placeholder="Ingrese imagen" id="imagen" name="imagen" autocomplete="off" >
        </div>
        @endif

        @if( $errors->has('imagen') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('imagen') }}</li></ul>
        @endif
    </div>


</div>
            <!--
    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
        <div class="form-group  pt-5">
            <label for="inputPassword">Yes/No Labels</label>
            <div class="switch-button switch-button-yesno">
                <input type="checkbox" checked="" name="swt8" id="swt8"><span>
                <label for="swt8"></label></span>
            </div>
        </div>
    </div>-->


<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
            <label for="inputPassword">Precio</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese precio" id="precio" name="precio" autocomplete="off" value="{{ isset($row->precio) ? $row->precio : '' }}" onkeypress="return IsNumeric2(event);">
        </div>
        @if( $errors->has('precio') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('precio') }}</li></ul>
        @endif
    </div>
    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
            <label for="inputPassword">Stock</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese stock" id="stock" name="stock" autocomplete="off" value="{{ isset($row->stock) ? $row->stock : '' }}"onkeypress="return IsNumeric(event);">
        </div>
        @if( $errors->has('stock') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('stock') }}</li></ul>
        @endif
    </div>
    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
            <label for="inputPassword">Descuento (%)</label>
            <input class="form-control form-control-xs" type="text"  placeholder="Ingrese descuento" id="descuento" name="descuento" autocomplete="off" value="{{ isset($row->descuento) ? intval($row->descuento) : '0' }}"onkeypress="return IsNumeric(event);" maxlength="3">
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
            <label for="inputPassword">ESTADO</label>
            <select class="select2 select2-xs" id="estado" name="estado">

            @if(isset($row->estado))
            <option value="0" {{ $row->estado == 0 ? "selected":""}}>INACTIVO</option>
            <option value="1" {{ $row->estado == 1 ? "selected":""}}>ACTIVO</option>

            @else

            <option value="0" >INACTIVO</option>
            <option value="1" selected>ACTIVO</option>
            @endif

            </select>
        </div>
        @if( $errors->has('estado') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('estado') }}</li></ul>
        @endif
    </div>
</div>

<div class="row pt-3">

    <div class="col-sm-12">
        <p class="text-right">
        <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Registrar Producto' : 'Modificar ' }}</button>
        <a href="{{url('list-producto')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
        </p>
    </div>
</div>

<script>
    $("#id_cat").change(function(){
        var cat = $("#id_cat option:selected").val()

        $.ajax({
        type: 'ajax',
        method: 'get',
        url: `{{ url('list_subcat_por_cat') }}`,
        data: {cat:cat} ,
        async: 'false',
        dataType: 'json',

        success : data=>{

         var html = ''
            for (var i = 0; i < data.length; i++) {
              html +=`<option value="${data[i].id_subcat}" >${data[i].nombre_subcat}</option>`
            }
          $('#id_subcat').html(html)
        },
        error: data=>{
          alert( "ERROR :cargar productos")
        }
      });
    })
</script>
