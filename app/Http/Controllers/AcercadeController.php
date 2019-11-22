<?php

namespace App\Http\Controllers;

use App\Acercade;
use App\Categoria;
use DB;
use Illuminate\Http\Request;

class AcercadeController extends Controller
{

    public function index()
    {
        $ace = Acercade::all();
        return view('admin.acerca_de.index', ["row" => $ace]);
    }

    public function nosotros()
    {
        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1";
        $sc = DB::select(DB::raw($slider_c));
        $cat = Categoria::where('estado', 1)->get();

        $ace = Acercade::all();
        return view('nosotros', [
            "row" => $ace,
            "cat" => $cat,
            "slider_c" => $sc,
        ]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = request()->except('_token');

        $validator = $this->validate($request, [
            'nosotros' => 'required|min:10',
            'mision' => 'required|min:10',
            'vision' => 'required|min:10',

        ]);

        $data['created_at'] = date("Y-m-d h:i:s");

        Acercade::insert($data);

        return redirect('acerca_de')->with('MensajeGuardar', 'Se guardo con éxito');
    }

    public function show(Acercade $acercade)
    {
        //
    }

    public function edit(Acercade $acercade)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $validator = $this->validate($request, [
            'nosotros' => 'required|min:10',
            'mision' => 'required|min:10',
            'vision' => 'required|min:10',

        ]);

        $data = request()->except(['_token', '_method']);

        Acercade::where('id', $id)->update($data);
        return redirect('acerca_de')->with('MensajeGuardar', 'Modificado con éxito');
    }

    public function destroy(Acercade $acercade)
    {
        //
    }
}
