<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="csrf-token" content="{{ csrf_token() }}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="author" content="">
	<!--icon-->
	<link rel="shortcut icon" href="{{ url('images/favicon.ico') }}">

	<title>Beagle</title>
	<link rel="stylesheet" type="text/css" href="{{ url('lib/perfect-scrollbar/css/perfect-scrollbar.css') }}" />
	<link rel="stylesheet" type="text/css" href="{{ url('lib/material-design-icons/css/material-design-iconic-font.min.css' ) }}" />

  <!---->
  <link rel="stylesheet" type="text/css" href="{{ url('lib/datetimepicker/css/bootstrap-datetimepicker.min.css') }}"/>
  <link rel="stylesheet" type="text/css" href="{{ url('lib/select2/css/select2.min.css') }}"/>
  <link rel="stylesheet" type="text/css" href="{{ url('lib/bootstrap-slider/css/bootstrap-slider.min.css') }}"/>

  <!---->
  <link rel="stylesheet" type="text/css" href="{{ url('lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css') }}"/>
  <link rel="stylesheet" type="text/css" href="{{ url('lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css') }}"/>

  <!---->
  <link rel="stylesheet" type="text/css" href="{{ url('lib/sweetalert2/sweetalert2.min.css') }}" />

  <link rel="stylesheet" type="text/css" href="{{ url('lib/jquery.magnific-popup/magnific-popup.css') }}"/>

  <link rel="stylesheet" href="{{ url('css/app.css' ) }}" type="text/css" />



	<script src="{{ url('lib/jquery/jquery.min.js' ) }}" type="text/javascript"></script>
	<script src="{{ url('lib/perfect-scrollbar/js/perfect-scrollbar.min.js' ) }}" type="text/javascript"></script>
	<script src="{{ url('lib/bootstrap/dist/js/bootstrap.bundle.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('js/app2.js' ) }}" type="text/javascript"></script>

  <!---->
  <script src="{{ url('lib/jquery-ui/jquery-ui.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/jquery.nestable/jquery.nestable.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/moment.js/min/moment.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datetimepicker/js/bootstrap-datetimepicker.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/select2/js/select2.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/select2/js/select2.full.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/bootstrap-slider/bootstrap-slider.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/bs-custom-file-input/bs-custom-file-input.js' ) }}" type="text/javascript"></script>

  <!---->
  <script src="{{ url('lib/datatables/datatables.net/js/jquery.dataTables.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons/js/buttons.flash.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/jszip/jszip.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/pdfmake/pdfmake.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/pdfmake/vfs_fonts.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons/js/buttons.print.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons/js/buttons.html5.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js' ) }}" type="text/javascript"></script>

  <script src="{{ url('lib/sweetalert2/sweetalert2.min.js' ) }}" type="text/javascript"></script>
  <script src="{{ url('js/ubigeo.js' ) }}" type="text/javascript"></script>

  <script src="{{ url('lib/jquery.magnific-popup/jquery.magnific-popup.min.js') }}" type="text/javascript"></script>
  <script src="{{ url('lib/masonry-layout/masonry.pkgd.min.js') }}" type="text/javascript"></script>


  <!-- Theme JS files -->
	<script src="{{ url('js/buttons/spin.min.js') }} "></script>
  <script src="{{ url('js/buttons/ladda.min.js') }} "></script>
  <script src="{{ url('js/buttons/components_buttons.js') }}"></script>

  <script>
    $.getJSON("{{ url('config.json') }}", function(datos) {
        $(".title_").text(`${datos['empresa_name']}`);
        $(".img_logo").attr("src","{{ url('')}}"+`/${datos['url_logo']}`);
    });
  </script>

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

</head>

<body>
  <div class="be-wrapper">
    <nav class="navbar navbar-expand fixed-top be-top-header">
      <div class="container-fluid">
        <!--logo-->
        <div class="be-navbar-header"><img src="" class="img_logo" alt="Avatar" width="20%" height="20%"><h2 class="page-head-title title_" ></h2>
        </div>
        <!--logo-->
        <div class="be-right-navbar">
          <ul class="nav navbar-nav float-right be-user-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                role="button" aria-expanded="false"><img  src="{{ url('images/avatar.png' ) }}" alt="Avatar">
                <!--<span class="user-name">Túpac Amaru</span>--></a>
              <div class="dropdown-menu" role="menu">
                <div class="user-info">
                  <div class="user-name">{{ Auth::user()->name }}</div>
                  <div class="user-position online">En linea</div>
                </div>
                <a class="dropdown-item" href="{{ url('/')}}">
                  <span class="icon mdi mdi-face"></span>Ir a la tienda</a><a class="dropdown-item" href="#">
                  <!--<span class="icon mdi mdi-settings"></span>Settings</a><a class="dropdown-item"
                  href="pages-login.html">
                  <span class="icon mdi mdi-power"></span>Logout-->
                </a>
              </div>
            </li>
          </ul>

<!--
          <ul class="nav navbar-nav float-right be-icons-nav">
            <li class="nav-item dropdown"><a class="nav-link be-toggle-right-sidebar" href="#" role="button"
                aria-expanded="false"><span class="icon mdi mdi-settings"></span></a></li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                role="button" aria-expanded="false"><span class="icon mdi mdi-notifications"></span><span
                  class="indicator"></span></a>
              <ul class="dropdown-menu be-notifications">
                <li>
                  <div class="title">Notifications<span class="badge badge-pill">3</span></div>
                  <div class="list">
                    <div class="be-scroller-notifications">
                      <div class="content">
                        <ul>
                          <li class="notification notification-unread"><a href="#">
                              <div class="image"><img src="{{ url('images/avatar2.png' ) }}" alt="Avatar"></div>
                              <div class="notification-info">
                                <div class="text"><span class="user-name">Jessica Caruso</span> accepted your invitation
                                  to join the team.</div><span class="date">2 min ago</span>
                              </div>
                            </a></li>
                          <li class="notification"><a href="#">
                              <div class="image"><img src="{{ url('images/avatar3.png' ) }}" alt="Avatar"></div>
                              <div class="notification-info">
                                <div class="text"><span class="user-name">Joel King</span> is now following you</div>
                                <span class="date">2 days ago</span>
                              </div>
                            </a></li>
                          <li class="notification"><a href="#">
                              <div class="image"><img src="{{ url('images/avatar4.png' ) }}" alt="Avatar"></div>
                              <div class="notification-info">
                                <div class="text"><span class="user-name">John Doe</span> is watching your main
                                  repository</div><span class="date">2 days ago</span>
                              </div>
                            </a></li>
                          <li class="notification"><a href="#">
                              <div class="image"><img src="{{ url('images/avatar5.png' ) }}" alt="Avatar"></div>
                              <div class="notification-info"><span class="text"><span class="user-name">Emily
                                    Carter</span> is now following you</span><span class="date">5 days ago</span></div>
                            </a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="footer"> <a href="#">View all notifications</a></div>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                role="button" aria-expanded="false"><span class="icon mdi mdi-apps"></span></a>
              <ul class="dropdown-menu be-connections">
                <li>
                  <div class="list">
                    <div class="content">
                      <div class="row">
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/github.png' ) }}"
                              alt="Github"><span>GitHub</span></a></div>
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/bitbucket.png' ) }}"
                              alt="Bitbucket"><span>Bitbucket</span></a></div>
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/slack.png' ) }}"
                              alt="Slack"><span>Slack</span></a></div>
                      </div>
                      <div class="row">
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/dribbble.png' ) }}"
                              alt="Dribbble"><span>Dribbble</span></a></div>
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/mail_chimp.png' ) }}"
                              alt="Mail Chimp"><span>Mail Chimp</span></a></div>
                        <div class="col"><a class="connection-item" href="#"><img src="{{ url('images/dropbox.png' ) }}"
                              alt="Dropbox"><span>Dropbox</span></a></div>
                      </div>
                    </div>
                  </div>
                  <div class="footer"> <a href="#">More</a></div>
                </li>
              </ul>
            </li>
          </ul>-->


        </div>
      </div>
	</nav>


	<div class="be-left-sidebar">
      <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">Blank Page</a>
        <div class="left-sidebar-spacer">
          <div class="left-sidebar-scroll">
            <div class="left-sidebar-content">
              <ul class="sidebar-elements">

                <li class="divider">Menu</li>
                {{--@can('ver-empresas')--}}
                <li><a href="{{ url('list-empresa') }}"><i class="icon mdi mdi-home"></i><span>Empresa</span></a></li>
                {{--@endcan--}}
                <li><a href="{{ url('list-sucursal') }}"><i class="icon mdi mdi-home"></i><span>Sucursal</span></a></li>

                <li><a href="{{ url('acerca_de') }}"><i class="icon mdi mdi-home"></i><span>Acerca de nosotros</span></a></li>

                <li class="parent"><a href="#"><i class="icon mdi mdi-folder"></i><span>Config. productos</span></a>
                  <ul class="sub-menu">
                    <li ><a href="{{ url('list-categoria') }}"><i class="icon mdi mdi-undefined"></i><span>Categoria</span></a></li>
                    <li ><a href="{{ url('list-subcategoria') }}"><i class="icon mdi mdi-undefined"></i><span>SubCategoria</span></a></li>
                    <li ><a href="{{ url('list-marca') }}"><i class="icon mdi mdi-undefined"></i><span>Marca</span></a></li>
                    <li ><a href="{{ url('list-producto') }}"><i class="icon mdi mdi-undefined"></i><span>Producto</span></a></li>
                    <li ><a href="{{ url('list-producto-galeria') }}"><i class="icon mdi mdi-undefined"></i><span>Producto-Galeria</span></a></li>
                    <li ><a href="{{ url('list-producto-caracteristica') }}"><i class="icon mdi mdi-undefined"></i><span>Producto-Caracteristicas</span></a></li>
                    <!--<li class="parent"><a href="#"><i class="icon mdi mdi-undefined"></i><span>Level 1</span></a>
                      <ul class="sub-menu">
                        <li><a href="#"><i class="icon mdi mdi-undefined"></i><span>Level 2</span></a>
                        </li>
                        <li class="parent"><a href="#"><i class="icon mdi mdi-undefined"></i><span>Level 2</span></a>
                          <ul class="sub-menu">
                            <li><a href="#"><i class="icon mdi mdi-undefined"></i><span>Level 3</span></a>
                            </li>
                            <li><a href="#"><i class="icon mdi mdi-undefined"></i><span>Level 3</span></a>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>-->
                  </ul>
                </li>

                <li class="parent"><a href="#"><i class="icon mdi mdi-folder"></i><span>Config. Visual</span></a>
                  <ul class="sub-menu">
                  <li ><a href="{{ url('productos-principales') }}"><i class="icon mdi mdi-undefined"></i><span>Productos Principales</span></a></li>
                  <li ><a href="{{ url('productos-ofertas') }}"><i class="icon mdi mdi-undefined"></i><span>Productos OFertas|Nuevos</span></a></li>
                  <li ><a href="{{ url('productos-categorizadas') }}"><i class="icon mdi mdi-undefined"></i><span>Productos Categorizadas</span></a></li>
                  </ul>
				        </li>

              </ul>
            </div>
          </div>
        </div>

      </div>
	</div>



	@yield('content')




	<nav class="be-right-sidebar">
      <div class="sb-content">
        <div class="tab-navigation">
          <ul class="nav nav-tabs nav-justified" role="tablist">
            <li class="nav-item" role="presentation"><a class="nav-link active" href="#tab1" aria-controls="tab1"
                role="tab" data-toggle="tab">Chat</a></li>
            <li class="nav-item" role="presentation"><a class="nav-link" href="#tab2" aria-controls="tab2" role="tab"
                data-toggle="tab">Todo</a></li>
            <li class="nav-item" role="presentation"><a class="nav-link" href="#tab3" aria-controls="tab3" role="tab"
                data-toggle="tab">Settings</a></li>
          </ul>
        </div>
        <div class="tab-panel">
          <div class="tab-content">
            <div class="tab-pane tab-chat active" id="tab1" role="tabpanel">
              <div class="chat-contacts">
                <div class="chat-sections">
                  <div class="be-scroller-chat">
                    <div class="content">
                      <h2>Recent</h2>
                      <div class="contact-list contact-list-recent">
                        <div class="user"><a href="#"><img src="{{ url('images/avatar1.png' ) }}" alt="Avatar">
                            <div class="user-data"><span class="status away"></span><span class="name">Claire
                                Sassu</span><span class="message">Can you share the...</span></div>
                          </a></div>
                        <div class="user"><a href="#"><img src="{{ url('images/avatar2.png' ) }}" alt="Avatar">
                            <div class="user-data"><span class="status"></span><span class="name">Maggie
                                jackson</span><span class="message">I confirmed the info.</span></div>
                          </a></div>
                        <div class="user"><a href="#"><img src="{{ url('images/avatar3.png' ) }}" alt="Avatar">
                            <div class="user-data"><span class="status offline"></span><span class="name">Joel King
                              </span><span class="message">Ready for the meeti...</span></div>
                          </a></div>
                      </div>
                      <h2>Contacts</h2>
                      <div class="contact-list">
                        <div class="user"><a href="#"><img src="{{ url('images/avatar4.png' ) }}" alt="Avatar">
                            <div class="user-data2"><span class="status"></span><span class="name">Mike Bolthort</span>
                            </div>
                          </a></div>
                        <div class="user"><a href="#"><img src="{{ url('images/avatar5.png' ) }}" alt="Avatar">
                            <div class="user-data2"><span class="status"></span><span class="name">Maggie jackson</span>
                            </div>
                          </a></div>
                        <div class="user"><a href="#"><img src="{{ url('images/avatar6.png' ) }}" alt="Avatar">
                            <div class="user-data2"><span class="status offline"></span><span class="name">Jhon
                                Voltemar</span></div>
                          </a></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="bottom-input">
                  <input type="text" placeholder="Search..." name="q"><span class="mdi mdi-search"></span>
                </div>
              </div>
              <div class="chat-window">
                <div class="title">
                  <div class="user"><img src="{{ url('images/avatar2.png' ) }}" alt="Avatar">
                    <h2>Maggie jackson</h2><span>Active 1h ago</span>
                  </div><span class="icon return mdi mdi-chevron-left"></span>
                </div>
                <div class="chat-messages">
                  <div class="be-scroller-messages">
                    <div class="content">
                      <ul>
                        <li class="friend">
                          <div class="msg">Hello</div>
                        </li>
                        <li class="self">
                          <div class="msg">Hi, how are you?</div>
                        </li>
                        <li class="friend">
                          <div class="msg">Good, I'll need support with my pc</div>
                        </li>
                        <li class="self">
                          <div class="msg">Sure, just tell me what is going on with your computer?</div>
                        </li>
                        <li class="friend">
                          <div class="msg">I don't know it just turns off suddenly</div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="chat-input">
                  <div class="input-wrapper"><span class="photo mdi mdi-camera"></span>
                    <input type="text" placeholder="Message..." name="q" autocomplete="off"><span
                      class="send-msg mdi mdi-mail-send"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane tab-todo" id="tab2" role="tabpanel">
              <div class="todo-container">
                <div class="todo-wrapper">
                  <div class="be-scroller-todo">
                    <div class="todo-content"><span class="category-title">Today</span>
                      <ul class="todo-list">
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" checked="" id="tck1">
                            <label class="custom-control-label" for="tck1">Initialize the project</label>
                          </div>
                        </li>
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck2">
                            <label class="custom-control-label" for="tck2">Create the main structure </label>
                          </div>
                        </li>
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck3">
                            <label class="custom-control-label" for="tck3">Updates changes to GitHub </label>
                          </div>
                        </li>
                      </ul><span class="category-title">Tomorrow</span>
                      <ul class="todo-list">
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck4">
                            <label class="custom-control-label" for="tck4">Initialize the project </label>
                          </div>
                        </li>
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck5">
                            <label class="custom-control-label" for="tck5">Create the main structure </label>
                          </div>
                        </li>
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck6">
                            <label class="custom-control-label" for="tck6">Updates changes to GitHub </label>
                          </div>
                        </li>
                        <li>
                          <div class="custom-checkbox custom-control custom-control-sm"><span
                              class="delete mdi mdi-delete"></span>
                            <input class="custom-control-input" type="checkbox" id="tck7">
                            <label class="custom-control-label" for="tck7"
                              title="This task is too long to be displayed in a normal space!">This task is too long to
                              be displayed in a normal space! </label>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="bottom-input">
                  <input type="text" placeholder="Create new task..." name="q"><span class="mdi mdi-plus"></span>
                </div>
              </div>
            </div>
            <div class="tab-pane tab-settings" id="tab3" role="tabpanel">
              <div class="settings-wrapper">
                <div class="be-scroller-settings"><span class="category-title">General</span>
                  <ul class="settings-list">
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" checked="" name="st1" id="st1"><span>
                          <label for="st1"></label></span>
                      </div><span class="name">Available</span>
                    </li>
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" checked="" name="st2" id="st2"><span>
                          <label for="st2"></label></span>
                      </div><span class="name">Enable notifications</span>
                    </li>
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" checked="" name="st3" id="st3"><span>
                          <label for="st3"></label></span>
                      </div><span class="name">Login with Facebook</span>
                    </li>
                  </ul><span class="category-title">Notifications</span>
                  <ul class="settings-list">
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" name="st4" id="st4"><span>
                          <label for="st4"></label></span>
                      </div><span class="name">Email notifications</span>
                    </li>
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" checked="" name="st5" id="st5"><span>
                          <label for="st5"></label></span>
                      </div><span class="name">Project updates</span>
                    </li>
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" checked="" name="st6" id="st6"><span>
                          <label for="st6"></label></span>
                      </div><span class="name">New comments</span>
                    </li>
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" name="st7" id="st7"><span>
                          <label for="st7"></label></span>
                      </div><span class="name">Chat messages</span>
                    </li>
                  </ul><span class="category-title">Workflow</span>
                  <ul class="settings-list">
                    <li>
                      <div class="switch-button switch-button-sm">
                        <input type="checkbox" name="st8" id="st8"><span>
                          <label for="st8"></label></span>
                      </div><span class="name">Deploy on commit</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </div>



  <script type="text/javascript">
  $(document).ready(function () {
    //e.preventDefault();
      //-initialize the javascript
      App.init();
      App.formElements();
      //App.uiSweetalert2();
      App.dataTables();
  });

  $(window).on('load',function(){
    App.pageGallery();
  });

  </script>

  <script>
  /**//**//*DEPA-PROV-DIST*//**//**//**/
  function seleccion(){
    $("#provincia").html(`<option value="{{ isset($row->provincia) ? $row->provincia:""}}" selected readonly>{{ isset($row->provincia) ? $row->provincia : ""}}</option>`)
    $('#_provincia').val(`{{ isset($row->provincia) ? $row->provincia:""}}`);

    $("#distrito").html(`<option value="{{  isset($row->distrito) ? $row->distrito:""}}" selected readonly>{{ isset($row->distrito) ? $row->distrito :""}}</option>`)
    $('#_distrito').val(`{{ isset($row->distrito) ? $row->distrito:""}}`);

  }
   //habilita depa
   var codpais = 51;
   var _depa = "";
   var selected = "";

    @if(isset($row->departamento))
      _depa = "{{ $row->departamento }}"
      $('#_departamento').val(_depa);
      seleccion()
    @endif

      $.ajax({
        type: 'ajax',
        method: 'get',
        url: `{{ url('list_depa') }}`,
        data: {codpais:codpais} ,
        async: 'false',
        dataType: 'json',
        beforeSend: data=>{
          $('#departamento').html("<option>cargando</option>")
        },
        success : data=>{

         var html = '<option value="0" selected disabled>seleccione</option>'
            for (var i = 0; i < data.length; i++) {
              if(_depa != "" && `${data[i].departamento}` == _depa){
                selected = "selected";
              }else{
                selected =""
              }
              html +=`<option value="${data[i].cod_departamento}" ${selected}>${data[i].departamento}</option>`
            }
          $('#departamento').html(html)


        },
        error: data=>{
          titulo = "Atencion";msj = "ERROR : EL DEPARTAMENTO NO SE LISTA"
            showDangerToast(titulo,msj)
        }
      });

      $("#departamento").change(function(){

      //habilita provincia
      var codpais = 51;
      coddepa = $('#departamento option:selected').val();
      var _depa =  $('#departamento option:selected').text();
      $('#_departamento').val(_depa);


      $.ajax({
        type: 'ajax',
        method: 'get',
        url: `{{ url('list_prov') }}`,
        data: {codpais:codpais,coddepa:coddepa} ,
        async: 'false',
        dataType: 'json',
        beforeSend: data=>{
            $('#provincia').html("<option>cargando</option>")
        },
        success : data=>{
          var html = '<option value="0" selected disabled>seleccione</option>'
            for (var i = 0; i < data.length; i++) {
              html +=`<option value="${data[i].cod_provincia}">${data[i].provincia}</option>`
          }
          $('#provincia').html(html)
        },
        error: data=>{
          titulo = "Atencion";msj = "ERROR : LA PROVINCIA NO SE LISTA"
            showDangerToast(titulo,msj)
        }
      });
    });

    $("#provincia").change(function(){

    //habilita distrito
    var codpais = 51;
    var coddepa = $('#departamento option:selected').val();
    var codprov = $('#provincia option:selected').val();

    var _prov =  $('#provincia option:selected').text();
    $('#_provincia').val(_prov);

    $.ajax({
      type: 'ajax',
      method: 'get',
      url: `{{ url('list_dist') }}`,
      data: {codpais:codpais,coddepa:coddepa,codprov:codprov} ,
      async: 'false',
      dataType: 'json',
      beforeSend: data=>{
          $('#distrito').html("<option>cargando</option>")
      },
      success : data=>{

        var html = '<option value="0" selected disabled>seleccione</option>'
          for (var i = 0; i < data.length; i++) {
            html +=`<option value="${data[i].cod_distrito}">${data[i].distrito}</option>`
          }

        $('#distrito').html(html)
      },
      error: data=>{
        titulo = "Atencion";msj = "ERROR : LA PROVINCIA NO SE LISTA"
          showDangerToast(titulo,msj)
      }
    });
  });


  $("#distrito").change(function(){

    var _dist = $('#distrito option:selected').text();
    $('#_distrito').val(_dist);

  });
  /**//**//*END DEPA-PROV-DIST*//**//**//**/
  </script>

  <script>
  /**//**//*ALERT DE CONFIRMACION*//**//**//**/
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }

  function QuestActionModal(obj,url,redirect,token){
    Swal.fire({
      title:`¿Estás seguro de Borrar ?`,
      text:`Se borrara ${obj} ,No podra revertir esto!`,
      confirmButtonText:"Si,Borrar",
      cancelButtonText: 'No, cancelar!',
      confirmButtonClass:"btn btn-danger",
      cancelButtonClass:"btn btn-secondary",
      showCloseButton:!0,
      showCancelButton:!0,
      customClass:"colored-header colored-header-danger"
    }).then((result) => {
      if (result.value) {
        $.ajax({
          url:url,
          type: 'POST',
          data: {
            "_method": 'DELETE',
            "_token": token,
          },
          success: response=>{
            window.location.href = `{{ url('${redirect}')}}`;
          },
          error: response=>{
            alert('Error:interno');
          }
        });
      }
    });
  }

  /*//empresa
  $('#tb_datos').on('click', '.delete', function(){
    var id = $(this).attr('data');
    var token = $('meta[name="csrf-token"]').attr('content');
    var url = `{{url('empresa/${id}')}}`
    QuestActionModal('Empresa',url,'list-empresa',token)
  });
*/
  </script>

<script>

  $("#btnguardar").click(function(){
    var token = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
      url:`{{ url('marca')}}`,
      type: 'POST',
      data: {
        "_method": 'POST',
        "_token": token,
      },
      success: response=>{
        window.location.href = `{{ url('marca')}}`;
      },
      error: response=>{
        alert('Error:interno');
      }
    });


  });

</script>




</body>
</html>
