<?php

namespace App\Http\Controllers;

use App\Categoria;
//use Auth;
use DB;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{

    public function index()
    {
        return view('admin.categoria.index');
    }

    public function producto_categoria($id_categ)
    {
        $car = array();

        //if (Auth::user()) {
        if (auth()->user()) {
            $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . auth()->user()->id));
        }

        $categoria = "SELECT * FROM categorias where estado = 1";
        $cat = DB::select(DB::raw($categoria));

        $subcat = "SELECT * FROM subcategorias where estado = 1 and id_cat = " . $id_categ;
        $scat = DB::select(DB::raw($subcat));

        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1";
        $sc = DB::select(DB::raw($slider_c));

        $produc_cat = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where c.id_cat = " . $id_categ . " and p.estado = 1 and subc.estado = 1 and c.estado = 1";
        $pc = DB::select(DB::raw($produc_cat));

        $carac = "SELECT * FROM producto_caracteristicas";
        $ca = DB::select(DB::raw($carac));

        //echo $id_categ;
        return view('producto_categoria', [
            //"oferta" => $so,
            "carac" => $ca,
            "subcat" => $scat,
            "pc" => $pc,
            "cat" => $cat,
            "slider_c" => $sc,
            "car" => $car,
            "id_categ" => $id_categ,
        ]);

    }

    public function list_categoria()
    {
        $categorias = Categoria::all();
        $data = compact('categorias');
        return view('admin.categoria.list_categoria', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = $this->validate($request, [
            'nombre' => 'required|max:250',
            'estado' => 'required',

        ]);

        #obtener toda la data
        $dataCategoria = request()->except('_token');
        #invoco al modelo e inserto toda la data
        Categoria::insert($dataCategoria);

        return redirect('list-categoria')->with('MensajeGuardar', 'Categoria ' . $request->input('nombre') . ' se guardo con éxito');
    }

    public function show(Categoria $categoria)
    {
        //
    }

    public function edit($id_categoria)
    {
        $row = Categoria::findOrFail($id_categoria);

        return view('admin.categoria.editar', ["row" => $row]);
    }

    public function update(Request $request, $id)
    {
        $validator = $this->validate($request, [
            'nombre' => 'required|max:250',
            'estado' => 'required',
        ]);

        $dataCategoria = request()->except(['_token', '_method']);

        Categoria::where('id_cat', $id)->update($dataCategoria);
        return redirect('list-categoria')->with('MensajeGuardar', 'Categoria ' . $request->input('nombre') . ' modificado con éxito');

    }

    public function destroy($id_categoria)
    {
        Categoria::where('id_cat', $id_categoria)->delete();
    }
}
