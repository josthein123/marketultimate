<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-group">
            <label for="inputPassword">Nosotros</label>
            <textarea  class="form-control form-control-xs"   name="nosotros" id="nosotros" cols="30" rows="3" requerid maxlength="800">
            {{ isset($row[0]->nosotros) ? $row[0]->nosotros : '' }}
            </textarea>
        </div>
    </div>
    @if( $errors->has('nosotros') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('nosotros') }}</li></ul>
    @endif
</div>

<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-group">
            <label for="inputPassword">Mision</label>
            <textarea  class="form-control form-control-xs"   name="mision" id="mision" cols="30" rows="3" requerid maxlength="800">
            {{ isset($row[0]->mision) ? $row[0]->mision : '' }}
            </textarea>
        </div>
    </div>
    @if( $errors->has('mision') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('mision') }}</li></ul>
    @endif
</div>


<div class="form-group row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-group">
            <label for="inputPassword">Vision</label>
            <textarea  class="form-control form-control-xs"   name="vision" id="vision" cols="30" rows="3" requerid maxlength="800">
            {{ isset($row[0]->vision) ? $row[0]->vision : '' }}
            </textarea>
        </div>
    </div>
    @if( $errors->has('vision') )
            <ul class="parsley-errors-list filled" id="parsley-id-5"><li class="parsley-required">{{ $errors->first('vision') }}</li></ul>
    @endif
</div>


<div class="row pt-3">
    <div class="col-sm-12">
        <p class="text-right">
        <button class="btn btn-primary btn-ladda btn-ladda-spinner" type="submit">{{ $Modo == 'crear' ? 'Registrar' : 'Modificar ' }}</button>
        </p>
    </div>
</div>
