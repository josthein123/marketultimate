<?php

namespace App\Http\Controllers;

use App\Slider_principal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SliderPrincipalController extends Controller
{

    public function index()
    {

        $producto = DB::select(DB::raw("SELECT *
        FROM productos where estado = 1
        AND NOT id_prod IN (SELECT id_prod FROM slider_principals)
       "));

        $slider = DB::select(DB::raw("SELECT sp.*,p.nombre FROM slider_principals sp inner join productos p
        on sp.id_prod = p.id_prod order by sp.id_sp desc"));

        return view('admin.slider.index', ["producto" => $producto, "datas" => $slider]);
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

        ]);
        $producto['created_at'] = date("Y-m-d h:i:s");

        Slider_principal::insert($producto);

        return redirect('productos-principales')->with('MensajeGuardar', 'Se añadio con éxito')->with('now', 'Justo Ahora');
    }

    public function show(Slider_principal $slider_principal)
    {
        //
    }

    public function edit(Slider_principal $slider_principal)
    {
        //
    }

    public function update(Request $request, Slider_principal $slider_principal)
    {
        //
    }

    public function destroy($id)
    {

        Slider_principal::destroy($id);
    }
}
