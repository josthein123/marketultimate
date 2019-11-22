<?php

namespace App\Http\Controllers;

use App\Producto;
use App\Producto_caracteristica;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductoCaracteristicaController extends Controller
{

    public function index()
    {
        //
    }

    public function list_producto_caracteristica()
    {

        $productos = DB::select(DB::raw("SELECT p.*, s.nombre as categoria,m.marca as marca,
            (select count(*) from producto_caracteristicas pc where pc.id_prod = p.id_prod) as total
                FROM productos as p inner join subcategorias as s
                on s.id_subcat = p.id_subcat inner join marcas as m
                on m.id_marca = p.id_marca
            "));

        $data = compact('productos');
        return view('admin.producto.list_producto_caracteristica', $data);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $producto = request()->except('_token');

        $validator = $this->validate($request, [

            'caracteristica' => 'required',

        ]);
        $producto['created_at'] = date("Y-m-d h:i:s");

        Producto_caracteristica::insert($producto);

        return redirect('producto_caracteristica/' . $request->input('id_prod') . '/edit')->with('MensajeGuardar', 'La caracteristica se añadio con éxito')->with('now', 'Justo Ahora');
    }

    public function show(Producto_caracteristica $producto_caracteristica)
    {
        //
    }

    public function edit($id_prod)
    {
        $producto = Producto::findOrFail($id_prod);

        $caract_producto = DB::table('producto_caracteristicas')
            ->where("id_prod", $id_prod)
            ->select('*')
            ->orderBy('id_caracteristica', 'desc')
            ->get();

        return view('admin.producto.index_caracteristica', ["row" => $producto, "caracteristica" => $caract_producto]);
    }

    public function update(Request $request, Producto_caracteristica $producto_caracteristica)
    {
        //
    }

    public function destroy($id_carac)
    {

        Producto_caracteristica::destroy($id_carac);
    }
}
