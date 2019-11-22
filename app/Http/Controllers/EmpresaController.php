<?php

namespace App\Http\Controllers;

use App\Departamento;
use App\Empresa;
use App\TipoDoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmpresaController extends Controller
{

    public function index()
    {
        $tipo_doc = TipoDoc::all()->where("estado", 1);
        $departamento = Departamento::all();

        return view('admin.empresa.index', ["tipo_doc" => $tipo_doc, "departamento" => $departamento]);
    }

    public function list_empresas()
    {
        $empresas = Empresa::all();
        $data = compact('empresas');
        return view('admin.empresa.list_empresa', $data);
    }

    public function store(Request $request)
    {

        $validator = $this->validate($request, [

            'id_tipdoc' => 'required',
            //'ruc' => 'required|min:8|max:11|unique:empresas,numero_ruc',
            'ruc' => 'required|min:8|max:11|unique:empresas',
            'nombre' => 'required|max:250',
            'direccion' => 'required|max:250',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'provincia' => 'required',
            'estado' => 'required',

        ]);

        DB::table('empresas')->insert([
            [
                'id_tipdoc' => $request->input('id_tipdoc') != "0" ? $request->input('id_tipdoc') : "",
                'nombre' => $request->input('nombre') != null ? $request->input('nombre') : "",
                'ruc' => $request->input('ruc') != null ? $request->input('ruc') : "",
                'agno_fiscal' => $request->input('agno_fiscal') != null ? $request->input('agno_fiscal') : "",
                'direccion' => $request->input('direccion') != null ? $request->input('direccion') : "",
                'telefono' => $request->input('telefono') != null ? $request->input('telefono') : "",
                'departamento' => $request->input('_departamento') != "0" ? $request->input('_departamento') : "",
                'provincia' => $request->input('_provincia') != "0" ? $request->input('_provincia') : "",
                'distrito' => $request->input('_distrito') != "0" ? $request->input('_distrito') : "",
                'correo' => $request->input('correo') != null ? $request->input('correo') : "",
                'web' => $request->input('web') != null ? $request->input('web') : "",
                'cod_sunat' => $request->input('cod_sunat') != null ? $request->input('cod_sunat') : "",
                'estado' => $request->input('estado') != null ? $request->input('estado') : "",
            ],
        ]);
        //Empresa::insert($data);
        return redirect('list-empresa')->with('MensajeGuardar', 'Empresa ' . $request->input('nombre') . ' se guardo con éxito');
    }

    public function show(Empresa $empresa)
    {
        //
    }

    public function edit($id_empresa)
    {
        $row = Empresa::findOrFail($id_empresa);
        $tipo_doc = TipoDoc::all()->where("estado", 1);
        $departamento = Departamento::all();

        return view('admin.empresa.editar', ["row" => $row, "tipo_doc" => $tipo_doc, "departamento" => $departamento]);
    }

    public function update(Request $request, $id)
    {

        $validator = $this->validate($request, [

            'id_tipdoc' => 'required',
            'ruc' => 'required|min:8|max:11|unique:empresas,ruc,' . $id . ',id_empresa',
            'nombre' => 'required|max:250',
            'direccion' => 'required|max:250',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'provincia' => 'required',
            'estado' => 'required',

        ]);

        DB::table('empresas')
            ->where('id_empresa', $id)
            ->update([
                'id_tipdoc' => $request->input('id_tipdoc') != "0" ? $request->input('id_tipdoc') : "",
                'nombre' => $request->input('nombre') != null ? $request->input('nombre') : "",
                'ruc' => $request->input('ruc') != null ? $request->input('ruc') : "",
                'agno_fiscal' => $request->input('agno_fiscal') != null ? $request->input('agno_fiscal') : "",
                'direccion' => $request->input('direccion') != null ? $request->input('direccion') : "",
                'telefono' => $request->input('telefono') != null ? $request->input('telefono') : "",
                'departamento' => $request->input('_departamento') != "0" ? $request->input('_departamento') : "",
                'provincia' => $request->input('_provincia') != "0" ? $request->input('_provincia') : "",
                'distrito' => $request->input('_distrito') != "0" ? $request->input('_distrito') : "",
                'correo' => $request->input('correo') != null ? $request->input('correo') : "",
                'web' => $request->input('web') != null ? $request->input('web') : "",
                'cod_sunat' => $request->input('cod_sunat') != null ? $request->input('cod_sunat') : "",
                'estado' => $request->input('estado') != null ? $request->input('estado') : "",
            ]);

        return redirect('list-empresa')->with('MensajeGuardar', 'Empresa ' . $request->input('nombre') . ' modificado con éxito');
    }

    public function destroy($id_empresa)
    {
        Empresa::where('id_empresa', $id_empresa)->delete();
    }
}
