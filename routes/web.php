<?php
Auth::routes();

//inicio
Route::get('/', 'ProductoController@inicio');
//ofertas
Route::get('/ofertas', 'ProductoController@ofertas');
//ver producto unico
Route::get('/ver-prod/{id_prod}', 'ProductoController@ver_prod');
Route::get('/ver-prod-js/{id_prod}', 'ProductoController@ver_prod_js');
//ver productos por categorias
Route::get('/ver-prod-cat/{id_cat}', 'CategoriaController@producto_categoria');
//locales
Route::get('/locales', 'SucursalController@locales');
// nosotros
Route::get('/nosotros', 'AcercadeController@nosotros');

//sesiones autenticados
Route::group(['middleware' => 'admin'], function () {
    //principal
    Route::get('/super-admin', function () {
        return view('admin.index');
    });
    //DataTable empresa
    Route::get('/list-empresa', 'EmpresaController@list_empresas'); //->middleware('permission:ver-empresas');
    //DataTable sucursal
    Route::get('/list-sucursal', 'SucursalController@list_sucursal');
    //DataTable Categoria
    Route::get('/list-categoria', 'CategoriaController@list_categoria');
    //DataTable Subategoria
    Route::get('/list-subcategoria', 'SubcategoriaController@list_subcategoria');
    //DataTable Marca
    Route::get('/list-marca', 'MarcaController@list_marca');
    //DataTable Producto
    Route::get('/list-producto', 'ProductoController@list_producto');
    //DataTable Galeria
    Route::get('/list-producto-galeria', 'ProductoGaleriaController@list_producto_galeria');
    //DataTable Caracteristica
    Route::get('/list-producto-caracteristica', 'ProductoCaracteristicaController@list_producto_caracteristica');

    Route::resource('empresa', 'EmpresaController');
    Route::resource('sucursal', 'SucursalController');
    Route::resource('categoria', 'CategoriaController');
    Route::resource('subcategoria', 'SubcategoriaController');
    Route::resource('producto', 'ProductoController');
    Route::resource('producto_galeria', 'ProductoGaleriaController');
    Route::resource('producto_caracteristica', 'ProductoCaracteristicaController');
    Route::resource('productos-principales', 'SliderPrincipalController');
    Route::resource('productos-ofertas', 'SliderOfertaController');
    Route::resource('productos-categorizadas', 'SliderCategoriaController');
    Route::resource('sucursal', 'SucursalController');
    Route::resource('marca', 'MarcaController');
});

//sesiones publicas siendo admin como no
Route::group(['middleware' => 'auth'], function () {

    Route::resource('carrito', 'CarritoController');
    Route::resource('venta', 'VentaController');
    Route::get('/verificador/{paymentToken}/{paymentID}', 'VentaController@venta_verificacion');
    Route::get('/list-sucursal-js', 'SucursalController@list_sucursal_js');
    Route::get('/mis-compras', 'VentaController@list_ventas');
    Route::get('/mis-items', 'VentaController@list_items');

    //depa
    Route::get('/list_depa', 'DepartamentoController@list_depa');
    //dist
    Route::get('/list_prov', 'ProvinciaController@list_prov');
    //prov
    Route::get('/list_dist', 'DistritoController@list_dist');
    //categoria_producto
    Route::get('/list_producto_por_cat', 'ProductoController@list_producto_por_cat');
    //categoria_subcat
    Route::get('/list_subcat_por_cat', 'ProductoController@list_subcat_por_cat');

    //ver_acercade
    Route::resource('/acerca_de', 'AcercadeController');

});
