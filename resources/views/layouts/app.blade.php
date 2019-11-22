<!--head-->
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- Mirrored from demo.devitems.com/boighor-v3/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 Sep 2019 20:20:11 GMT -->

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title class="title_"></title>
	<meta name="description" content="">

	<!-- Favicons -->
	<link rel="shortcut icon" href="{{ url('images/favicon.ico') }}">
	<link rel="apple-touch-icon" href="{{ url('images/icons/icon.png') }}">

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">



	<!-- Stylesheets -->
	<link rel="stylesheet" href="{{ url('css/bootstrap.min.css') }}">
	<link rel="stylesheet" href="{{ url('css/plugins.css') }}">
	<link rel="stylesheet" href="{{ url('css/style.css') }}">
    <link rel="stylesheet" href="{{ url('css/bootstrap-datepicker.min.css') }}">
	<!-- Cusom css -->
    <link rel="stylesheet" href="{{ url('css/custom.css') }}">
    <style>
    .my-custom-scrollbar {
position: relative;
height: 180px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
#text-ajuste{
    font-size:small;
    white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 150px;


}
    </style>

	<!-- Modernizer js -->
    <script src="{{ url('js/vendor/modernizr-3.5.0.min.js') }}"></script>

    <script type="text/javascript">
		var specialKeys = new Array();
		specialKeys.push(8); //Backspace
		function IsNumeric(e) {
			var keyCode = e.which ? e.which : e.keyCode
			var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
			return ret;
		}
	</script>
	<script type="text/javascript">
		var specialKeys = new Array();
		specialKeys.push(8); //Backspace
		function IsNumeric2(e) {
			var keyCode = e.which ? e.which : e.keyCode
			var ret = ((keyCode >= 48 && keyCode <= 57) || (specialKeys.indexOf(keyCode) != -1) || (keyCode == 46));
			return ret;
		}
	</script>

<!--<script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>-->

</head>

<body>
<!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    @include('header')

        <!--body-->
        @yield('content')
        <!--endbody-->


        <!--footer-->

        <!-- Footer Area -->
        <footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
			<div class="footer-static-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="footer__widget footer__menu">
								<div class="ft__logo">
									<a href="{{ url('')}}">
										<img src="" class="img_logo" alt="logo">
									</a>
                                    <p>Sin más que decir me despido, deseando que tengas un feliz emprendimiento ¡Hasta la próxima!</p>
                                    <p>siguenos por:</p>
								</div>
								<div class="footer__content">
									<ul class="social__net social__net--2 d-flex justify-content-center">
										<li><a href="#"><i class="bi bi-facebook"></i></a></li>
										<li><a href="#"><i class="bi bi-google"></i></a></li>
										<li><a href="#"><i class="bi bi-twitter"></i></a></li>
										<li><a href="#"><i class="bi bi-linkedin"></i></a></li>
										<li><a href="#"><i class="bi bi-youtube"></i></a></li>
									</ul>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright__wrapper" style="background:#CDCDCA;padding:20px 10px;">
				<div class="container" >
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">

							<div class="copyright">
								<div class="copy__right__inner text-left">
									<p>Copyright <i class="fa fa-copyright"></i> <a href="#">IziMarket.</a> Todos los derechos Reservados</p>
								</div>
                            </div>

						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="payment text-right">
								<img src="{{ url('images/icons/payment.png') }}" alt="" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- //Footer Area -->
		<!-- QUICKVIEW PRODUCT
		<div id="quickview-wrapper">
			<div class="modal fade" id="productmodal" tabindex="-1" role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
									aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="{{ url('public/images/product/big-img/1.jpg') }}">
									</div>
								</div>
								<div class="product-info">
									<h1>Simple Fabric Bags</h1>
									<div class="rating__and__review">
										<ul class="rating">
											<li><span class="ti-star"></span></li>
											<li><span class="ti-star"></span></li>
											<li><span class="ti-star"></span></li>
											<li><span class="ti-star"></span></li>
											<li><span class="ti-star"></span></li>
										</ul>
										<div class="review">
											<a href="#">4 customer reviews</a>
										</div>
									</div>
									<div class="price-box-3">
										<div class="s-price-box">
											<span class="new-price">$17.20</span>
											<span class="old-price">$45.00</span>
										</div>
									</div>
									<div class="quick-desc">
										Designed for simplicity and made from high quality materials. Its sleek geometry
										and material combinations creates a modern look.
									</div>
									<div class="select__color">
										<h2>Select color</h2>
										<ul class="color__list">
											<li class="red"><a title="Red" href="#">Red</a></li>
											<li class="gold"><a title="Gold" href="#">Gold</a></li>
											<li class="orange"><a title="Orange" href="#">Orange</a></li>
											<li class="orange"><a title="Orange" href="#">Orange</a></li>
										</ul>
									</div>
									<div class="select__size">
										<h2>Select size</h2>
										<ul class="color__list">
											<li class="l__size"><a title="L" href="#">L</a></li>
											<li class="m__size"><a title="M" href="#">M</a></li>
											<li class="s__size"><a title="S" href="#">S</a></li>
											<li class="xl__size"><a title="XL" href="#">XL</a></li>
											<li class="xxl__size"><a title="XXL" href="#">XXL</a></li>
										</ul>
									</div>
									<div class="social-sharing">
										<div class="widget widget_socialsharing_widget">
											<h3 class="widget-title-modal">Share this product</h3>
											<ul class="social__net social__net--2 d-flex justify-content-start">
												<li class="facebook"><a href="#" class="rss social-icon"><i
															class="zmdi zmdi-rss"></i></a></li>
												<li class="linkedin"><a href="#" class="linkedin social-icon"><i
															class="zmdi zmdi-linkedin"></i></a></li>
												<li class="pinterest"><a href="#" class="pinterest social-icon"><i
															class="zmdi zmdi-pinterest"></i></a></li>
												<li class="tumblr"><a href="#" class="tumblr social-icon"><i
															class="zmdi zmdi-tumblr"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="addtocart-btn">
										<a href="#">Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		 -->
	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->

	<script src="{{ url('js/vendor/jquery-3.2.1.min.js') }}"></script>
	<script src="{{ url('js/popper.min.js') }}"></script>
	<script src="{{ url('js/bootstrap.min.js') }}"></script>
	<script src="{{ url('js/plugins.js') }}"></script>
	<script src="{{ url('js/active.js') }}"></script>
    <script src="{{ url('js/blockui.min.js') }}"></script>
    <script src="{{ url('js/sweet_alert.min.js') }}"></script>
    <script src="{{ url('js/sweet_alert.min.js') }}"></script>
    <script src="{{ url('js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ url('js/bootstrap-colorpicker.min.js') }}"></script>

    <script>
        $.getJSON("{{ url('config.json') }}", function(datos) {
            $(".title_").text(`${datos['empresa_name']}`);
            $(".img_logo").attr("src","{{ url('')}}"+`/${datos['url_logo']}`);
            //console.log(datos)
        });
    </script>

    <script src="https://www.paypalobjects.com/api/checkout.js"></script>

    <script>

    <?php if (isset($view_venta_dolar_final)): ?>
    var base = "{{ url('verificador') }}";
        paypal.Button.render({
            // Configure environment
            // env: 'production',
            env: 'sandbox',
            client: {
                //jost
                sandbox: 'AabiYWaKCjrm1GxZi3EpIBAZUQV-FIP7q2saD5JtkPPWdNBATJUeOOh8eU7Pck7RI0SN8J8HVxoRrO3w',
                //soto
                //production: 'AbYf-lce1XsdoLRSe_fsvMeWTaMqOVSqXMvlYY5hWdyZEn_MH-T6M23emq223HtxYj_tnfVkUKqbz5c8'
            },
            // Customize button (optional)
            locale: 'es_PE',
            label: 'checkout',
            style: {
                size: 'responsive',
                color: 'black',
                shape: 'pill',
            },

            // Enable Pay Now checkout flow (optional)
            commit: true,

            // Set up a payment
            payment: function(data, actions) {
            return actions.payment.create({
                transactions: [{
                amount: {
                    total: '<?php echo $view_venta_dolar_final ?>',
                    currency: 'USD',
                },
                description: 'Compra de producto softyfact : <?php echo $view_venta_dolar_final ?>' ,
                custom: '<?php echo $id_venta ?>#<?php echo $view_venta_code_pago ?>'
                }]
            });
            },
            // Execute the payment
            onAuthorize: function(data, actions) {
            return actions.payment.execute().then(function() {
                // Show a confirmation message to the buyer
                //window.alert('Thank you for your purchase!');
                console.log(data)
                window.location = base+'/'+data.paymentToken+'/'+data.paymentID
            });
            }
        },'#paypal-button-container');
    <?php endif?>
    </script>


    <script>
    $("#nav_grid").click(function(){
        $("#valor").val(1)
    })
    $("#nav_list").click(function(){
        $("#valor").val(0)
    })

    $("#filtro").change(function(){
        $("#filtro option").each(function(){
            var valor = $(this).text().replace(/ /g, "")
            $(`#nav-grid-${valor}`).removeClass("show active")
            $(`#nav-list-${valor}`).removeClass("show active")
        });
        var op = $("#filtro option:selected").text().replace(/ /g, "")
        $("#nav_grid").attr("href",`#nav-grid-${op}`)
        $("#nav_list").attr("href",`#nav-list-${op}`)

        if($("#valor").val() == 1){
            $(`#nav-list-${op}`).removeClass("show active")
            $(`#nav-grid-${op}`).addClass("show active")
        }else{
            $(`#nav-list-${op}`).addClass("show active")
        }

    });
    </script>

    <script>
    $('#so').on('click', '.so', function(){

        var id = $(this).attr('data');
        var cant = $(`#vp_cantidad${id}`).val()
        if(cant != null){
            cant = $(`#vp_cantidad${id}`).val()
        }else{
            cant = 1
        }

        add_car(id,"{{ isset(Auth::user()->id) ? Auth::user()->id : '' }}",cant)
    });

    $('#sc').on('click', '.sc', function(){
        var cant = $("#vp_cantidad").val()
        var id = $(this).attr('data');
        if(cant != null){
            cant = $("#vp_cantidad").val()
        }else{
            cant = 1
        }
        add_car(id,"{{ isset(Auth::user()->id) ? Auth::user()->id : '' }}",cant)

    });

    function add_car(idprod,iduser,cant){
        var light = $('#wrapper').parent();
        $(light).block({
            message: `<div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center">
                                <img src="{{ url('add_car.gif') }}" height="120px"    >
                                <h4 class="title__be--2">Agregando,  <span class="color--theme"> Espere ...</span></h4>
                            </div>
                        </div>
                    </div>`,
                    centerY: false,
                    centerX: false,
            overlayCSS: {
                backgroundColor: '#fff',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                //position: 'fixed',
                margin: 'auto',
                border: 0,
                padding: 0,
                backgroundColor: 'none'
            }
        });


        var token = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            type: 'ajax',
            method: 'POST',
            url: `{{ url('carrito') }}`,
            data: {
                "_method": 'POST',
                "_token": token,
                id_prod:idprod,
                id_user:iduser,
                cantidad:cant
                } ,
            dataType: 'json',
            async: 'false',
            success : response=>{
                console.log()
                if(response.mensaje !=null){
                    alert("LA CANTIDAD SOBREPASA O NO HAY STOCK , LO SENTIMOS!!!  ")
                    $(light).delay(2).fadeIn().unblock();
                    act_prod_vista(idprod)
                    return
                }
                    setTimeout(function(){
                        $(light).delay(2).fadeIn().unblock();
                    },1200);

                    var total = 0
                    var html = ''
                    $(".cant_total_carrito").text(`${response.length} item(s)`)
                    $(".product_qun").text(`${response.length}`)
                    for (let index = 0; index < response.length; index++) {
                        total += parseFloat(response[index].subt)
                    }
                    $(".total_carrito").text(`S/. ${total.toFixed(2)}`)

                    for (let i = 0; i < response.length; i++) {

                    html += `
                    <tr class="table_tr${response[i].id}">
                        <td>
                            <div class="thumb">
                                <a href="#"><img src="{{asset('storage/${response[i].imagen}')}}" height ="90px">
                                </a>
                            </div>
                        </td>
                        <td width="1">
                            <div class="content ">
                                <h4 id="text-ajuste"><a href="#">${response[i].nombre}</a></h4>
                                <div class="product__content content--center ">`;

                                    if(response[i].descuento > 0){
                            html +=`<li class="old_prize" style ="text-decoration:line-through;">S/. ${response[i].precio}</li>
                                    <li class="prize" style="color:#ce7852">S/. ${ (response[i].precio - (response[i].precio * (response[i].descuento / 100))  ).toFixed(2)}</li>`;
                                    }else{
                            html +=`<li class="prize">S/. ${response[i].precio}</li>`;
                                    }
                            html +=`<li class="prize">UN : ${response[i].cant}</li>`;


                        html +=`</div>
                            </div>
                        </td>
                        <td>
                            <div class="content ">
                                <div class="product_prize d-flex justify-content-between">
                                    <ul class="d-flex justify-content-end">
                                        <li><a href="#borrado"><i class="zmdi zmdi-delete"  data ="${response[i].id}-${response[i].id_prod}"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                    `;
                    }
                    $("#table_car").html(html)
                    act_prod_vista(idprod)
            },
            error: response=>{
                alert( "ERROR en app.blade :comunica a soporte")
            }
        });
    }

    /*ELIMINAR PRODUCTOS DEL CARRO*/
    $('#table_car').on('click', '.zmdi-delete', function(){

        var light = $('#wrapper').parent();
        $(light).block({
            message: `<div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center">
                                <img src="{{ url('public/delete_car.png') }}" height="120px"    >
                                <h4 class="title__be--2">Eliminado,  <span class="color--theme"> Espere ...</span></h4>
                            </div>
                        </div>
                    </div>`,
                    transition: 0,
                    centerY: false,
                    centerX: false,
            overlayCSS: {
                backgroundColor: '#fff',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                //position: 'fixed',
                margin: 'auto',
                border: 0,
                padding: 0,
                backgroundColor: 'none'
            }
        });
        var id = $(this).attr('data').split('-')[0];
        var idprod = $(this).attr('data').split('-')[1];
        var token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: `{{ url('carrito/${id}') }}`,
            type: 'POST',
            data: {
                "_method": 'DELETE',
                "_token": token,
                "id":id
            },
            dataType: 'json',
            success: response=>{
console.log(response)
                setTimeout(function(){
                    $(light).delay(2).fadeIn().unblock();
                },1200);

                if(response.fila.length == 0){
                    $("#table_car").html(`<tr> <td colspan="3" align="center"><p style="color:red">Tu carrito esta vacio</p></td> </tr>`)
                    $(".product_qun").text('0')
                }

                var total = 0
                $(`.table_tr${id}`).remove()

                $(".cant_total_carrito").text(`${response.fila.length} item(s)`)
                $(".product_qun").text(`${response.fila.length}`)

                for (let index = 0; index < response.fila.length; index++) {
                    total += parseFloat(response.fila[index].subt)
                }
                $(".total_carrito").text(`S/. ${total.toFixed(2)}`)

                act_prod_vista(idprod)


                //console.log(response)
            },
            error: response=>{
            alert('Error app.blade: No se pudo eliminar producto del carrito');
            }
        });


    });

    $('#so').on('click', '.zmdi-delete', function(){
        var light = $('#wrapper').parent();
        $(light).block({
            message: `<div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center">
                                <img src="{{ url('public/delete_car.png') }}" height="120px"    >
                                <h4 class="title__be--2">Eliminado,  <span class="color--theme"> Espere ...</span></h4>
                            </div>
                        </div>
                    </div>`,
                    transition: 0,
                    centerY: false,
                    centerX: false,
            overlayCSS: {
                backgroundColor: '#fff',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                margin: 'auto',
                border: 0,
                padding: 0,
                backgroundColor: 'none'
            }
        });
        var id = $(this).attr('data').split('-')[0];
        var idprod = $(this).attr('data').split('-')[1];
        var token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: `{{ url('carrito/${id}') }}`,
            type: 'POST',
            data: {
                "_method": 'DELETE',
                "_token": token,
                "id":id
            },
            dataType: 'json',
            success: response=>{
                //console.log(response)

                setTimeout(function(){
                    $(light).delay(2).fadeIn().unblock();
                },1200);

                if(response.fila.length == 0){
                    $("#table_car").html(`<tr> <td colspan="3" align="center"><p style="color:red">Tu carrito esta vacio</p></td> </tr>`)
                }

                var total = 0
                $(`.table_tr${id}`).remove()

                $(".cant_total_carrito").text(`${response.fila.length} item(s)`)
                $(".product_qun").text(`${response.fila.length}`)

                for (let index = 0; index < response.fila.length; index++) {
                    total += parseFloat(response.fila[index].subt)
                }
                $(".total_carrito").text(`S/. ${total.toFixed(2)}`)

                tablero(response)
                act_prod_vista(idprod)

                //console.log(response)
            },
            error: response=>{
            alert('Error app.blade: No se pudo eliminar producto del carrito');
            }
        });
    });
    /*END ELIMINAR*/

    function tablero(response,costo_envio = null,descuento = null,tasa = null){
        var costo_ = 0
        var response_ = 0

        if(costo_envio == null){
            // $("#tipo_entrega option[value=1]").attr("selected",true);
            $("#tipo_entrega").val("");
            $("#div_direccion").hide();
            $(".car_adicional").text(" 0.00 ");
            for (let index = 0; index < response.totales.length; index++) {
                var desc = parseFloat(response.totales[index].descuento)
                var igv = parseFloat(response.totales[index].igv)
                var sub = parseFloat(response.totales[index].subtotal)
                var total = parseFloat(response.totales[index].total)
            }

            $("#car_total_hidden").val((total).toFixed(2))
            $(".car_desc ").text(desc.toFixed(2))
            $(".car_igv ").text(igv.toFixed(2))
            $(".car_sub ").text(sub.toFixed(2))
            $(".car_total ").text("S/ "+(total).toFixed(2))
            $(".car_total_dolar ").text("$ "+(total / response.tasa).toFixed(2))
        }else{

            costo_ = parseFloat(costo_envio)
            response_ = parseFloat(response)
            var total_ = costo_ + response_
            var sub = (total_ /1.18)
            var igv = (sub *0.18)
            var descuento_ = parseFloat(descuento)
            var tasa_ = parseFloat(tasa)

            $(".car_total ").text("S/ "+(total_).toFixed(2))
            $(".car_desc ").text( (descuento_).toFixed(2))
            $(".car_igv ").text(igv.toFixed(2))
            $(".car_sub ").text(sub.toFixed(2))
            $(".car_total_dolar").text("$ "+(total_ / tasa_).toFixed(2))

        }


    }

    /*ACTUALZIAR PRODUCTO DEL CARRITO */

    $('#so').on('click', '.zmdi-save', function(){

        var light = $('#wrapper').parent();
        $(light).block({
            message: `<div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center">
                                <img src="{{ url('public/updating_car.gif') }}" height="120px"    >
                                <h4 class="title__be--2">Actualizando,  <span class="color--theme"> Espere ...</span></h4>
                            </div>
                        </div>
                    </div>`,
                    transition: 0,
                    centerY: false,
                    centerX: false,
            overlayCSS: {
                backgroundColor: '#fff',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                margin: 'auto',
                border: 0,
                padding: 0,
                backgroundColor: 'none'
            }
        });

        var idcar = $(this).attr('data').split('-')[0];
        var idprod = $(this).attr('data').split('-')[1];
        var cant = $(`#vp_cantidad${idprod}`).val()

        var token = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            url: `{{ url('carrito/${idcar}') }}`,
            type: 'POST',
            data: {
                "_method": 'PUT',
                "_token": token,
                "idprod":idprod,
                "cant":cant
            },
            dataType: 'json',
            success: response=>{

                if(response.mensaje !=null){
                    alert("LA CANTIDAD SOBREPASA O NO HAY STOCK , LO SENTIMOS!!!  ")
                    $(light).delay(2).fadeIn().unblock();
                    act_prod_vista(idprod)
                    return
                }

                setTimeout(function(){
                    $(light).delay(2).fadeIn().unblock();
                },1200);
                //console.log(response)

                for (let prod = 0; prod < response.fila.length; prod++) {

                    var col_total = parseFloat(response.fila[prod].subt)
                    var col_cant = parseFloat(response.fila[prod].cant)

                    $(`.product-subtotal${response.fila[prod].id}`).text("S/. "+(col_total).toFixed(2))
                    //$(`#vp_cantidad${response.fila[prod].id_prod}`).val(col_cant)
                }

                tablero(response)

            },
            error: response=>{
                alert('Error app.blade: No se pudo actualizar producto del carrito');
            }
        });

    });
    /*END ACTUALZIAR */

    $('#so').on('click', '.btn-mas', function(){
        let id_prod = $(this).attr('data');
        let stock =  parseFloat($(`#vp_stock${id_prod}`).val())
        let val = 1
        let cant = parseFloat($(`#vp_cantidad${id_prod}`).val())
        if(cant < stock){
            $(`#vp_cantidad${id_prod}`).val(cant+val)
        }
    });

    $('#so').on('click', '.btn-menos', function(){
        let id_prod = $(this).attr('data');
        let val = 1
        let cant = parseFloat($(`#vp_cantidad${id_prod}`).val())
        if(cant > 1){
            $(`#vp_cantidad${id_prod}`).val(cant-val)
        }
    });

    function act_prod_vista(id_prod){
        var token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: `{{ url('ver-prod-js/${id_prod}') }}`,
            type: 'GET',
            data: {
                "_method": 'GET',
                "_token": token,
                "opc":"1"
            },
            dataType: 'json',
            success: response=>{
                //console.log(response.stock);
                var id_prod_vista =$("#id_prod_vu");

                if(id_prod_vista.length  > 0){
                    if(id_prod_vista.val() == id_prod){
                        let stock =  parseFloat($("#barra_stock").text(` ${response.stock} En Stock`))
                        let stock_hidden =  parseFloat($(`#vp_stock${id_prod}`).val(`${response.stock}`))
                        let cantidad = $(`#vp_cantidad${id_prod}`).val(1)
                    }
                }
            },
            error: response=>{
                alert('Error app.blade : (act_prod_vista): No se pudo traer el producto ');
            }
        });
    }

    </script>

    <script>

    $("#tipo_entrega").change(function(){


        $("#div_direccion").show()
        $(".car_adicional").text(" 0.00 ")

        var token = $('meta[name="csrf-token"]').attr('content');
        var te = $("#tipo_entrega option:selected").val()
        var html_direc = ''

          if(te == 0){
            $("#mns_entrega").text("¿Cuándo lo recoges?")

            $.ajax({
                type: 'POST',
                url: `{{ url('list-sucursal-js') }}`,
                data: {
                    "_method": 'GET',
                    "_token": token,
                    estado:'1',
                } ,
                dataType: 'json',
                success : response=>{

                    html_direc +=`
                    <label>¿Dónde vas a recoger? <span>*</span></label>
                    <select  id="direccion_pp" class="form-control" name="direccion"  required>
                    <option value="" disabled selected> SELECCIONE</option>`
                    for (let index = 0; index < response.length; index++) {
                        html_direc +=`<option value="${response[index].direccion}-${response[index].departamento}-${response[index].distrito}" > ${response[index].direccion}-${response[index].departamento}-${response[index].distrito}</option>`;
                    }
                    html_direc +=`</select>`;
                    $("#div_direccion").html(html_direc)
                },
                error: response=>{
                    alert('Error app.blade: No se pudo cargar tipo de entrega');
                }
            });

          }else{
            //   config->costo_envio
            <?php if (isset($config)): ?>
            var costo_envio = "<?php echo $config ?>"
            //
            $(".car_adicional").text( costo_envio )
            var total = $("#car_total_hidden").val()
            var descuento = $(".car_desc").text()
            var tasa = $(".car_tasa").text()
            tablero(total,costo_envio,descuento,tasa)

            $("#mns_entrega").text("¿Cuándo lo llevamos?")
            html_direc +=`
            <label>¿A Dónde te lo llevamos? <span> indique la dirección detalladamente  </span></label>
            <label>Horario 8:00 - 20:00 <span> costo adicional S/. ${costo_envio}  </span></label>
            <div class="input__box">
                <input id="direccion" placeholder="ingrese su direccion" type="text" class="form-control is-invalid " name="direccion" required  maxlength="250">
            </div>`
            $("#div_direccion").html(html_direc)
            <?php endif;?>
          }


    });

    /*ver Ventas*/

    $('.wn_accordion').on('click', '.collapsed', function(){


        let id_ = $(this).attr('data').split('-')[0];
        var token = $('meta[name="csrf-token"]').attr('content');
        //no volver a consultar
        var valor = $(`#valor${id_}`).val()

        if(valor == 0){
            $.ajax({
                type: 'POST',
                url: `{{ url('mis-items') }}`,
                data: {
                    "_method": 'GET',
                    "_token": token,
                    "id":id_,
                } ,
                dataType: 'json',
                success : response=>{

                    $(`#valor${id_}`).val(1)
                    //console.log(response)
                    var html = ''
                    for (let index = 0; index < response.length; index++) {
                        html += `
                        <tr>
                            <td>${index+1}</td>
                            <td class="product-thumbnail"><a href="#"><img src="{{asset('storage/${response[index].imagen}')}}" height="85px"></a></td>
                            <td ><a href="#">${response[index].nombre}</a></td>
                            <td ><span class="amount">S/ ${response[index].precio}</span></td>
                            <td >${response[index].cantidad}</td>
                            <td >S/ ${response[index].total}</td>
                            <td style="color:green;">$ ${(response[index].total / response[index].tasa_ac).toFixed(2)}</td>
                        </tr>
                        `
                    }
                    $(`#rowacordion${id_}`).html(html)

                },
                error: response=>{
                    alert('Error app.blade: No se pudo cargar mis-items');
                }
            });
        }
    });

    $("#direccion_pp").change(function(){

        alert(1)

    });

    var date = new Date();
    var end_date = new Date();

    date.setDate(date.getDate() + parseInt(3));
    end_date.setDate(end_date.getDate() + parseInt(10));

  $(function(){
    $("#fecha_envio").datepicker({
      format: `yyyy-mm-dd 00:00:00`,
      clearBtn: true,
      language: "es",
      autoclose: true,
      todayHighlight: true,
      toggleActive: true,
      startDate : date,
      endDate : end_date

    });

   /*   $("#fecha_envio").change(function(){
    var minValue = $(this).val();

      var rformat = minValue.split('/').reverse().join('-');

      $('input[name=fecha_seleccionada]').val(rformat);

    });*/
  });


    </script>

</body>

<!-- Mirrored from demo.devitems.com/boighor-v3/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 Sep 2019 20:20:57 GMT -->

</html>

<!--nedfooter-->
