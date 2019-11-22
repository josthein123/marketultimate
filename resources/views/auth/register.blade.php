@extends('layouts.app')

@section('menu')
    <div class="col-lg-8 d-none d-lg-block">
        <nav class="mainmenu__nav">
            <ul class="meninmenu d-flex justify-content-start">


            </ul>
        </nav>
    </div>
@endsection

@section('menu_movil')
<!-- Start Mobile Menu -->
    <div class="row d-none">
        <div class="col-lg-12 d-none">
            <nav class="mobilemenu__nav">
                <ul class="meninmenu">

                </ul>
            </nav>
        </div>
    </div>
@endsection

@section('content')

<br>
<br>
<section class="my_account_area pt--80 pb--55 bg--white">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0"></div>
                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-0">
                    <div class="my__account__wrapper">
                        <h3 class="account__title">Registrar</h3>

                        <form method="POST" action="{{ route('register') }}">
                        @csrf
                            <div class="account__form">
                                <div class="input__box">
                                    <label>Nombre <span>*</span></label>
                                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="input__box">
                                    <label>Correo <span>*</span></label>
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" >
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="input__box">
                                    <label>Contraseña <span>*</span></label>
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" value="{{ old('password') }}" required  >
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="input__box">
                                    <label>Confirmar Contraseña <span>*</span></label>
                                    <input id="password-confirm" type="password" class="form-control @error('email') is-invalid @enderror" name="password_confirmation" value="{{ old('password_confirmation') }}" required >
                                </div>

                                <div class="form__btn">
                                    <button type="submit">Registrar</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 mb-0"></div>
        </div>
    </div>
</section>
<br>
<br>
<br><br>
@endsection
