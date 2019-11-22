<?php

namespace App\Http\Controllers;

use App\Slider_oferta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SliderOfertaController extends Controller
{

    public function index()
    {
        $producto = DB::select(DB::raw("SELECT *
        FROM productos where estado = 1
        AND NOT id_prod IN (SELECT id_prod FROM slider_ofertas)
       "));

        $slider = DB::select(DB::raw("SELECT so.*,p.nombre FROM slider_ofertas so inner join productos p
        on so.id_prod = p.id_prod order by so.id_so desc"));

        return view('admin.slider.index_oferta', ["producto" => $producto, "datas" => $slider]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $producto = request()->except('_token');

        $validator = $this->validate($request, [

            'id_prod' => 'required',
            'etiqueta' => 'required',

        ]);
        $producto['created_at'] = date("Y-m-d h:i:s");

        Slider_oferta::insert($producto);

        return redirect('productos-ofertas')->with('MensajeGuardar', 'Se añadio con éxito')->with('now', 'Justo Ahora');
    }

    public function show(Slider_oferta $slider_oferta)
    {
        //
    }

    public function edit(Slider_oferta $slider_oferta)
    {
        //
    }

    public function update(Request $request, Slider_oferta $slider_oferta)
    {
        //
    }

    public function destroy($id)
    {

        Slider_oferta::destroy($id);
    }
}
