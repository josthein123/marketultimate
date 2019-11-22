<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-0">
        <div class="form-group">
        <label for="inputPassword">Categoria</label>
        <select class="select2 select2-xs" id="id_cat" name="id_cat" >
                @foreach($categoria as $cat)

                    @if(isset($row->id_cat))
                    <option value="{{ $cat->id_cat}}" {{ $row->id_cat == $cat->id_cat ? "selected":""}} >{{ $cat->nombre}}</option>
                    @else
                    <option value="{{ $cat->id_cat}}"  >{{ $cat->nombre}}</option>
                    @endif

                @endforeach
        </select>
            @if( $errors->has('id_cat') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_cat') }}</li></ul>
            @endif
        </div>
    </div>
</div>

<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-group">
            <label for="inputPassword">Sub categoria</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese Sub categoria" id="nombre" name="nombre" autocomplete="off" value="{{ isset($row->nombre) ? $row->nombre : '' }}">
        </div>
    </div>
    @if( $errors->has('nombre') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('nombre') }}</li></ul>
    @endif
</div>

<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-group">
            <label for="inputPassword">Descripcion</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese descripcion" id="descripcion" name="descripcion" autocomplete="off" value="{{ isset($row->descripcion) ? $row->descripcion : '' }}">
        </div>
    </div>
</div>

<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
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
        <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Registrar Sub Categoria' : 'Modificar ' }}</button>
        <a href="{{url('list-subcategoria')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
        </p>
    </div>
</div>
