<?php

namespace App\Http\Controllers;

use App\Categoria;
use App\Slider_categoria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SliderCategoriaController extends Controller
{

    public function index()
    {

        $slider = DB::select(DB::raw("SELECT sc.*,p.nombre FROM slider_categorias sc inner join productos p
        on sc.id_prod = p.id_prod order by sc.id_sc desc"));

        $categoria = Categoria::all()->where('estado', 1);
        return view('admin.slider.index_categoria', ["categoria" => $categoria, "datas" => $slider]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $producto = request()->except('_token', 'id_cat');

        $validator = $this->validate($request, [

            'id_prod' => 'required',

        ]);
        $producto['created_at'] = date("Y-m-d h:i:s");

        Slider_categoria::insert($producto);

        return redirect('productos-categorizadas')->with('MensajeGuardar', 'Se añadio con éxito')->with('now', 'Justo Ahora');
    }

    public function show(Slider_categoria $slider_categoria)
    {
        //
    }

    public function edit(Slider_categoria $slider_categoria)
    {
        //
    }

    public function update(Request $request, Slider_categoria $slider_categoria)
    {
        //
    }

    public function destroy($id)
    {

        Slider_categoria::destroy($id);
    }
}
