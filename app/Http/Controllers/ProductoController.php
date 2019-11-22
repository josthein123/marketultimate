<?php

namespace App\Http\Controllers;

use App\Categoria;
use App\Marca;
use App\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductoController extends Controller
{
    public function inicio($id_cat = null)
    {
        $car = array();

        if (Auth::user()) {
            $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . Auth::user()->id));
        }

        $slider_p = " SELECT p.*
        from slider_principals sp inner join productos p
        on sp.id_prod = p.id_prod inner join subcategorias sub
		on p.id_subcat = sub.id_subcat inner join categorias cat
		on sub.id_cat = cat.id_cat
        where p.estado = 1 and sub.estado = 1 and cat.estado = 1";

        $slider_o = "SELECT p.*,so.etiqueta
        from slider_ofertas so inner join productos p
        on so.id_prod = p.id_prod inner join subcategorias sub
		on p.id_subcat = sub.id_subcat inner join categorias cat
		on sub.id_cat = cat.id_cat
        where p.estado = 1 and sub.estado = 1 and cat.estado = 1";
        #$slider_c => extensiones de productos del modulo productos
        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1";

        $slider_por_cat = "SELECT p.*,c.id_cat
        from slider_categorias sc inner join productos p
        on sc.id_prod = p.id_prod inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on subc.id_cat = c.id_cat where  p.estado = 1 and subc.estado = 1 and c.estado = 1";

        $categoria = "SELECT * FROM categorias where estado = 1";

        $sp = DB::select(DB::raw($slider_p));
        $so = DB::select(DB::raw($slider_o));
        $sc = DB::select(DB::raw($slider_c));
        $spc = DB::select(DB::raw($slider_por_cat));
        $cat = DB::select(DB::raw($categoria));
        return view('welcome', [
            // "prod" => $prod,
            "slider_p" => $sp,
            "slider_o" => $so,
            "slider_c" => $sc,
            "slider_cat" => $spc,
            "cat" => $cat,
            "car" => $car,
        ]);
    }

    public function ofertas()
    {
        $car = array();

        if (Auth::user()) {
            $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . Auth::user()->id));
        }

        $slider_o = "SELECT p.*,so.etiqueta,c.id_cat
        from slider_ofertas so inner join productos p
        on so.id_prod = p.id_prod  inner join subcategorias sc
        on p.id_subcat = sc.id_subcat inner join categorias c
        on sc.id_cat = c.id_cat
        where p.estado = 1 and sc.estado = 1 and c.estado = 1 and so.etiqueta = 'OFERTA'";

        // $ofertas = Slider_oferta::with(["producto" => function ($q) {
        //     $q->where('estado', 1);
        // }])
        //     ->where('etiqueta', 'OFERTA')
        //     ->get();

        $so = DB::select(DB::raw($slider_o));

        // dd($ofertas);

        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1 ";
        $sc = DB::select(DB::raw($slider_c));

        $categoria = "SELECT * FROM categorias where estado = 1";
        $cat = DB::select(DB::raw($categoria));

        $carac = "SELECT * FROM producto_caracteristicas";
        $ca = DB::select(DB::raw($carac));

        return view('ofertas', [
            "oferta" => $so,
            "carac" => $ca,
            "cat" => $cat,
            "slider_c" => $sc,
            "car" => $car,
        ]);
    }

    public function ver_prod_js($id_prod)
    {
        $producto = Producto::where('id_prod', $id_prod)->firstOrFail();
        echo json_encode($producto);
    }

    public function ver_prod($id_prod)
    {

        $car = array();

        if (Auth::user()) {
            $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . Auth::user()->id));
        }

        $producto = Producto::where('id_prod', $id_prod)->firstOrFail();

        $producto_galeria = "SELECT * FROM producto_galerias where id_prod =" . $id_prod;
        $pg = DB::select(DB::raw($producto_galeria));

        $productos_relacinados = "SELECT * FROM productos where estado = 1 and id_prod <> " . $id_prod . " and id_subcat =" . $producto->id_subcat;
        $prod_r = DB::select(DB::raw($productos_relacinados));

        $carac = "SELECT * FROM producto_caracteristicas where id_prod =" . $id_prod;
        $ca = DB::select(DB::raw($carac));

        $categoria = "SELECT * FROM categorias where estado = 1";
        $cat = DB::select(DB::raw($categoria));

        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1";
        $sc = DB::select(DB::raw($slider_c));

        return view('producto_unico', [
            "car" => $car,
            "producto" => $producto,
            "prod_gal" => $pg,
            "prod_r" => $prod_r,
            "carac" => $ca,
            "cat" => $cat,
            "slider_c" => $sc,

        ]);

    }

    public function index()
    {
        $marca = Marca::all()->where("estado", 1);
        $categoria = Categoria::all()->where("estado", 1);

        return view('admin.producto.index', ["marca" => $marca, "categoria" => $categoria]);
    }

    public function list_producto_por_cat(Request $request)
    {
        $producto = DB::select(DB::raw("SELECT p.*
        from productos p inner join subcategorias sc
        on p.id_subcat = sc.id_subcat inner join categorias c
        on sc.id_cat = c.id_cat
        where p.estado = 1 and  sc.estado = 1 and c.estado = 1
        and NOT id_prod IN (SELECT id_prod FROM slider_categorias)
        and c.id_cat = " . $request->input('cat') . " "));

        echo json_encode($producto);
    }

    public function list_subcat_por_cat(Request $request)
    {
        if ($request->input('opc_view') != null) {
            $producto = DB::select(DB::raw("SELECT c.id_cat,p.*
            from productos p inner join subcategorias sc
            on p.id_subcat = sc.id_subcat inner join categorias c
            on sc.id_cat = c.id_cat
            WHERE c.id_cat = " . $request->input('cat') . " and p.estado = 1 and  sc.estado = 1 and c.estado = 1 "));

        } else {
            $producto = DB::select(DB::raw("SELECT sc.id_subcat,sc.nombre as nombre_subcat
            from subcategorias sc inner join categorias c
            on sc.id_cat = c.id_cat
            and c.id_cat = " . $request->input('cat') . "  and  sc.estado = 1 and c.estado = 1"));
        }

        echo json_encode($producto);
    }

    public function list_producto()
    {

        $productos = DB::table('productos as p')
            ->where('s.estado', 1)
            ->where('m.estado', 1)
            ->where('c.estado', 1)
            ->join('subcategorias as s', 's.id_subcat', '=', 'p.id_subcat')
            ->join('categorias as c', 'c.id_cat', '=', 's.id_cat')
            ->join('marcas as m', 'm.id_marca', '=', 'p.id_marca')
            ->select('p.*', 's.nombre as categoria', 'm.marca as marca')
            ->orderBy('p.id_prod', 'desc')
            ->get();

        $data = compact('productos');
        return view('admin.producto.list_producto', $data);
    }

    public function create()
    {
        //
    }
    public function store(Request $request)
    {
        $validator = $this->validate($request, [

            'id_subcat' => 'required',
            'id_marca' => 'required',
            'cod_producto' => 'required|max:50|unique:productos',
            'nombre' => 'required|max:250',
            'imagen' => 'required',
            'precio' => 'required',
            'stock' => 'required',
            'estado' => 'required',

        ]);
        #obtener toda la data
        $producto = request()->except('_token', 'id_cat');
        if ($request->hasFile('imagen')) {
            #modificando el campo imagen y almacenar en public/uploads
            #store almacenar fotos
            $producto['imagen'] = $request->file('imagen')->store('uploads', 'public');

        }
        $producto['created_at'] = date("Y-m-d h:i:s");
        #invoco al modelo e inserto toda la data
        Producto::insert($producto);

        return redirect('list-producto')->with('MensajeGuardar', 'Producto  ' . $request->input('nombre') . ' se guardo con éxito');

    }

    public function show(Producto $producto)
    {
        //
    }

    public function edit($id_prod)
    {
        $categoria = Categoria::all()->where("estado", 1);
        $marca = Marca::all()->where("estado", 1);
        $row = Producto::findOrFail($id_prod);
        $subcat = DB::table('subcategorias')
            ->select('*')
            ->where('estado', 1)
            ->where('id_subcat', $row->id_subcat)
            ->get();

        $data = array("id_subcat_" => $subcat[0]->id_subcat, "nombre_" => $subcat[0]->nombre);

        return view('admin.producto.editar', ["row" => $row, "marca" => $marca, "categoria" => $categoria, "data" => $data]);
    }

    public function update(Request $request, $id)
    {

        $validator = $this->validate($request, [

            'id_subcat' => 'required',
            'id_marca' => 'required',
            'cod_producto' => 'required|max:50|unique:productos,cod_producto,' . $id . ',id_prod',
            'nombre' => 'required|max:250',
            'precio' => 'required',
            'stock' => 'required',
            'estado' => 'required',

        ]);

        $producto = request()->except(['_token', '_method', 'id_cat']);
        if ($request->hasFile('imagen')) {
            #trae la data
            $row = Producto::findOrFail($id);
            #borro la foto de tal ruta
            #definir use \Storage arriba
            Storage::delete('public/' . $row->imagen);
            #modificando el campo file y almacenar en public/uploads
            #store almacenar fotos
            $producto['imagen'] = $request->file('imagen')->store('uploads', 'public');

        }
        Producto::where('id_prod', $id)->update($producto);
        return redirect('list-producto')->with('MensajeGuardar', 'Producto ' . $request->input('nombre') . ' modificado con éxito');
    }

    public function destroy($id_prod)
    {
        #trae la data
        $row = Producto::findOrFail($id_prod);

        if (Storage::delete('public/' . $row->imagen)) {
            #destroy borrar
            Producto::destroy($id_prod);
        }

    }
}
