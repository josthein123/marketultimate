<?php

namespace App\Http\Controllers;

use App\Producto;
use App\Producto_galeria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductoGaleriaController extends Controller
{

    public function index()
    {
        //
    }

    public function list_producto_galeria()
    {

        $productos = DB::select(DB::raw("SELECT p.*, s.nombre as categoria,m.marca as marca,
        (select count(*) from producto_galerias pg where pg.id_prod = p.id_prod) as total
            FROM productos as p inner join subcategorias as s
            on s.id_subcat = p.id_subcat inner join marcas as m
            on m.id_marca = p.id_marca
           "));

        $data = compact('productos');
        return view('admin.producto.list_producto_galeria', $data);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {

        $producto = request()->except('_token');

        $validator = $this->validate($request, [

            'imagen' => 'required',

        ]);

        if ($request->hasFile('imagen')) {
            $producto['imagen'] = $request->file('imagen')->store('uploads', 'public');

        }
        $producto['created_at'] = date("Y-m-d h:i:s");

        Producto_galeria::insert($producto);

        return redirect('producto_galeria/' . $request->input('id_prod') . '/edit')->with('MensajeGuardar', 'La foto se añadio con éxito');
    }

    public function show(Producto_galeria $producto_galeria)
    {
        //
    }

    public function edit($id_prod)
    {
        $producto = Producto::findOrFail($id_prod);
        $galeria_producto = DB::table('producto_galerias')
            ->where("id_prod", $id_prod)
            ->select('*')
            ->orderBy('id_galeria', 'desc')
            ->get();
        return view('admin.producto.index_galeria', ["row" => $producto, "galeria" => $galeria_producto]);
    }

    public function update(Request $request, $id)
    {

        //

    }

    public function destroy($id_galeria)
    {
        #trae la data
        $row = Producto_galeria::findOrFail($id_galeria);

        if (Storage::delete('public/' . $row->imagen)) {
            #destroy borrar
            Producto_galeria::destroy($id_galeria);
        }

        //return redirect('producto_galeria/' . $request->input('id_prod') . '/edit');
    }
}
