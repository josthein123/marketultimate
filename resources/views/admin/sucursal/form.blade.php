
<div class="form-group row ">

    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
        <div class="form-group">
        <label for="inputPassword">Empresa</label>
        <select class="select2 select2-xs" id="id_empresa" name="id_empresa" >
                @foreach($empresa as $emp)
                    @if(isset($row->id_empresa))
                    <option value="{{ $emp->id_empresa}}" {{ $row->id_empresa == $emp->id_empresa ? "selected":"" }} >{{ $emp->nombre ."-".$emp->ruc}}</option>
                    @else
                    <option value="{{ $emp->id_empresa}}"  >{{ $emp->nombre ."-".$emp->ruc}}</option>
                    @endif
                @endforeach
        </select>
            @if( $errors->has('id_tipdoc') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_tipdoc') }}</li></ul>
            @endif
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="inputPassword">Tipo Documento</label>
        <select class="select2 select2-xs" id="id_tipdoc" name="id_tipdoc" >
                @foreach($tipo_doc as $tip)

                    @if(isset($row->id_tipdoc))
                    <option value="{{ $tip->id_tipdoc}}" {{ $row->id_tipdoc == $tip->id_tipdoc ? "selected":""}} >{{ $tip->nombre}}</option>
                    @else
                    <option value="{{ $tip->id_tipdoc}}"  >{{ $tip->nombre}}</option>
                    @endif

                @endforeach
        </select>
            @if( $errors->has('id_tipdoc') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('id_tipdoc') }}</li></ul>
            @endif
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0">
        <div class="form-group">
        <label for="">Ruc</label>
            <div class="input-group input-group-xs mb-2 ">
                <input  onkeypress="return IsNumeric(event);" class="form-control form-control-xs" type="text" placeholder="Ingrese ruc" id="ruc" name="ruc" autocomplete="off" value="{{ isset($row->ruc) ? $row->ruc : '' }}">
                <div class="input-group-prepend">
                    <div class="input-group-append">
                        <button class="btn btn-secondary" id="inputGroupFileAddon04" type="button">Buscar</button>
                    </div>
                </div>
            </div>
        </div>
        @if( $errors->has('ruc') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('ruc') }}</li></ul>
            @endif
    </div>
</div>
<div class="form-group row ">
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
        <div class="form-group">
            <label for="">Razon Social</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese razon social" id="nombre" name="nombre" autocomplete="off" onkeyup="mayus(this);" value="{{ isset($row->nombre) ? $row->nombre : '' }}">
        </div>
        @if( $errors->has('nombre') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('nombre') }}</li></ul>
        @endif
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
        <div class="form-group">
            <label for="inputPassword">Direccion</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese direccion" id="direccion" name="direccion" autocomplete="off" onkeyup="mayus(this);" value="{{ isset($row->direccion) ? $row->direccion : '' }}">
        </div>
        @if( $errors->has('direccion') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('direccion') }}</li></ul>
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

<div class="form-group row ">
    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
        <label for="inputPassword">Departamento</label>
        <select class="select2 select2-xs" id="departamento" name="departamento">
            <option value="0" selected>seleccione</option>
        </select>
        <input type="hidden" name="_departamento" id="_departamento">
        </div>
        @if( $errors->has('departamento') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('departamento') }}</li></ul>
        @endif
    </div>
    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
        <label for="inputPassword">Provincia</label>
        <select class="select2 select2-xs" id="provincia" name="provincia">
            <option value="0" selected>seleccione</option>
        </select>
        <input type="hidden" name="_provincia" id="_provincia">
        </div>
        @if( $errors->has('provincia') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('provincia') }}</li></ul>
        @endif
    </div>
    <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-0">
        <div class="form-group">
        <label for="inputPassword">Distrito</label>
        <select class="select2 select2-xs" id="distrito" name="distrito">
            <option value="0" selected>seleccione</option>
        </select>
        <input type="hidden" name="_distrito" id="_distrito">
        </div>
        @if( $errors->has('distrito') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('distrito') }}</li></ul>
        @endif
    </div>
</div>

<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
        <div class="form-group">
            <label for="inputPassword">Correo</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese Correo" id="correo" name="correo" autocomplete="off" value="{{ isset($row->correo) ? $row->correo : '' }}">
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-2 mb-0">
        <div class="form-group">
            <label for="inputPassword">Telefono</label>
            <input class="form-control form-control-xs" type="text" placeholder="Ingrese Telefono" id="telefono" name="telefono" autocomplete="off" onkeypress="return IsNumeric(event);" value="{{ isset($row->telefono) ? $row->telefono : '' }}">
        </div>
    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-2 mb-0">
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

    <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-2 mb-0">
        @if(isset($row->imagen) && $row->imagen != "")
        <div class="form-group">
            <label for="">IMAGEN <a href="{{ asset('storage/'.$row->imagen) }}" target="_blank" >(ver actual)</a></label>
                <input class="form-control form-control-xs" type="file" placeholder="Ingrese imagen" id="imagen" name="imagen" autocomplete="off" >
        </div>
        @else
        <div class="form-group">
            <label for="">IMAGEN<a href="{{url('local_predeterminado.png')}}" target="_blank" >(ver predeterminado)</a></label>
            <input class="form-control form-control-xs" type="file" placeholder="Ingrese imagen" id="imagen" name="imagen" autocomplete="off" >
        </div>
        @endif

        @if( $errors->has('imagen') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('imagen') }}</li></ul>
        @endif
    </div>

</div>
    <!--
    <div class="form-group row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
            <div class="form-group">
                <label for="inputPassword">Yes/No Labels</label>
                    <div class="input-group date datetimepicker" data-min-view="2" data-date-format="yyyy-mm-dd">
                    <input class="form-control form-control-xs" size="16" type="text" value="">
                    <div class="input-group-append">
                        <button class="btn btn-primary"><i class="icon-th mdi mdi-calendar"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
            <div class="form-group">
                <label for="inputPassword">Yes/No Labels</label>
                    <div class="input-group date datetimepicker" data-min-view="2" data-date-format="yyyy-mm-dd">
                    <input class="form-control form-control-xs" size="16" type="text" value="">
                    <div class="input-group-append">
                        <button class="btn btn-primary"><i class="icon-th mdi mdi-calendar"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
    <label for="inputPassword">select</label>
        <select class="select2 select2-xs">
            <option value="CT">Connecticut</option>
            <option value="DE">Delaware</option>
            <option value="FL">Florida</option>
            <option value="GA">Georgia</option>
            <option value="IN">Indiana</option>
            <option value="ME">Maine</option>
            <option value="MD">Maryland</option>
            <option value="MA">Massachusetts</option>
            <option value="MI">Michigan</option>
            <option value="NH">New Hampshire</option>
            <option value="NJ">New Jersey</option>
            <option value="NY">New York</option>
            <option value="NC">North Carolina</option>
            <option value="OH">Ohio</option>
            <option value="PA">Pennsylvania</option>
            <option value="RI">Rhode Island</option>
            <option value="SC">South Carolina</option>
            <option value="VT">Vermont</option>
            <option value="VA">Virginia</option>
            <option value="WV">West Virginia</option>
        </select>
    </div>
        -->
    <div class="row pt-3">
    <!--<div class="col-lg-6 pb-4 pb-lg-0">
        <div class="be-checkbox custom-control custom-checkbox">
        <input class="custom-control-input" type="checkbox" id="check1">
        <label class="custom-control-label" for="check1">Remember me</label>
        </div>
    </div>-->
    <div class="col-sm-12">
        <p class="text-right">
        <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Registrar Sucursal' : 'Modificar ' }}</button>
        <a href="{{url('list-sucursal')}}"><button class="btn btn-space btn-secondary" type="button">Cancelar</button></a>
        </p>
    </div>
</div>
