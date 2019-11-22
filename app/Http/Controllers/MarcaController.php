<?php

namespace App\Http\Controllers;

use App\Marca;
use Illuminate\Http\Request;

class MarcaController extends Controller
{

    public function index()
    {
        return view('admin.marca.index');
    }
    public function list_marca()
    {
        $marca = Marca::all();
        $data = compact('marca');
        return view('admin.marca.list_marca', $data);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = $this->validate($request, [
            'marca' => 'required|max:250',
            'estado' => 'required',

        ]);

        #obtener toda la data
        $marca = request()->except('_token');
        #invoco al modelo e inserto toda la data
        Marca::insert($marca);

        return redirect('list-marca')->with('MensajeGuardar', 'Marca  ' . $request->input('marca') . ' se guardo con éxito');
    }

    public function show(Marca $marca)
    {
        //
    }

    public function edit($id_marca)
    {
        $row = Marca::findOrFail($id_marca);

        return view('admin.marca.editar', ["row" => $row]);
    }

    public function update(Request $request, $id)
    {

        $validator = $this->validate($request, [
            'marca' => 'required|max:250',
            'estado' => 'required',
        ]);
        $marca = request()->except(['_token', '_method']);

        Marca::where('id_marca', $id)->update($marca);
        return redirect('list-marca')->with('MensajeGuardar', 'Marca ' . $request->input('marca') . ' modificado con éxito');
    }

    public function destroy($id_marca)
    {
        Marca::where('id_marca', $id_marca)->delete();
    }
}
