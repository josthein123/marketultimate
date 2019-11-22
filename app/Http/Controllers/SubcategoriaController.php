<?php

namespace App\Http\Controllers;

use App\Categoria;
use App\Subcategoria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubcategoriaController extends Controller
{

    public function index()
    {
        $categoria = Categoria::all()->where("estado", 1);
        return view('admin.subcategoria.index', ["categoria" => $categoria]);
    }
    public function list_subcategoria()
    {
        $subcategorias = DB::table('categorias as c')
            ->where('c.estado', 1)
            ->join('subcategorias as s', 'c.id_cat', '=', 's.id_cat')
            ->select('s.*', 'c.nombre as namecat')
            ->get();

        $data = compact('subcategorias');
        return view('admin.subcategoria.list_subcategoria', $data);
    }
    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = $this->validate($request, [
            'id_cat' => 'required',
            'nombre' => 'required|max:250',
            'estado' => 'required',

        ]);

        #obtener toda la data
        $datasubcategoria = request()->except('_token');
        #invoco al modelo e inserto toda la data
        Subcategoria::insert($datasubcategoria);

        return redirect('list-subcategoria')->with('MensajeGuardar', 'Sub categoria ' . $request->input('nombre') . ' se guardo con éxito');
    }

    public function show(Subcategoria $subcategoria)
    {
        //
    }

    public function edit($id_subcategoria)
    {

        $row = Subcategoria::findOrFail($id_subcategoria);
        $categoria = Categoria::all()->where("estado", 1);

        return view('admin.subcategoria.editar', ["row" => $row, "categoria" => $categoria]);
    }

    public function update(Request $request, $id)
    {
        $validator = $this->validate($request, [
            'id_cat' => 'required',
            'nombre' => 'required|max:250',
            'estado' => 'required',

        ]);

        $datasubCategoria = request()->except(['_token', '_method']);

        Subcategoria::where('id_subcat', $id)->update($datasubCategoria);
        return redirect('list-subcategoria')->with('MensajeGuardar', 'Sub categoria ' . $request->input('nombre') . ' modificado con éxito');
    }

    public function destroy($id_subcategoria)
    {
        Subcategoria::where('id_subcat', $id_subcategoria)->delete();
    }
}
