<?php

namespace App\Http\Controllers;

use App\Categoria;
use App\Departamento;
use App\Empresa;
use App\Sucursal;
use App\TipoDoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class SucursalController extends Controller
{

    public function index()
    {
        $tipo_doc = TipoDoc::all()->where("estado", 1);
        $departamento = Departamento::all();
        // $Productos = Producto::where('id_prod', $id_prod)->firstOrFail();
        $empresa = Empresa::all()->where("estado", 1);

        return view('admin.sucursal.index', ["tipo_doc" => $tipo_doc, "departamento" => $departamento, "empresa" => $empresa]);
    }
    public function list_sucursal(Request $request)
    {

        if ($request->input("estado") != null) {
            $sucursales = Sucursal::all()->where("estado", 1);
            echo json_encode($sucursales);
        } else {
            $sucursales = Sucursal::all();
            $data = compact('sucursales');
            return view('admin.sucursal.list_sucursal', $data);
        }

    }
    public function list_sucursal_js()
    {
        $sucursales = Sucursal::all()->where("estado", 1);
        echo json_encode($sucursales);
    }

    public function locales()
    {

        $data = Sucursal::where("estado", 1)->get();

        $slider_c = "SELECT p.*,c.id_cat
        from  productos p inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on c.id_cat =subc.id_cat where p.estado = 1 and subc.estado = 1 and c.estado = 1";
        $sc = DB::select(DB::raw($slider_c));
        $cat = Categoria::where('estado', 1)->get();

        return view('locales', [
            "cat" => $cat,
            "slider_c" => $sc,
            "sucursal" => $data,

        ]);

    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = $this->validate($request, [

            'id_empresa' => 'required',
            'id_tipdoc' => 'required',
            'ruc' => 'required|min:8|max:11',
            'nombre' => 'required|max:250',
            'direccion' => 'required|max:250',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'provincia' => 'required',
            'estado' => 'required',

        ]);

        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen')->store('uploads', 'public');
        }

        DB::table('sucursals')->insert([
            [
                'id_empresa' => $request->input('id_empresa') != null ? $request->input('id_empresa') : "",
                'id_tipdoc' => $request->input('id_tipdoc') != "0" ? $request->input('id_tipdoc') : "",
                'nombre' => $request->input('nombre') != null ? $request->input('nombre') : "",
                'ruc' => $request->input('ruc') != null ? $request->input('ruc') : "",
                'direccion' => $request->input('direccion') != null ? $request->input('direccion') : "",
                'telefono' => $request->input('telefono') != null ? $request->input('telefono') : "",
                'departamento' => $request->input('_departamento') != "0" ? $request->input('_departamento') : "",
                'provincia' => $request->input('_provincia') != "0" ? $request->input('_provincia') : "",
                'distrito' => $request->input('_distrito') != "0" ? $request->input('_distrito') : "",
                'correo' => $request->input('correo') != null ? $request->input('correo') : "",
                'imagen' => isset($imagen) ? $imagen : '',
                'estado' => $request->input('estado') != null ? $request->input('estado') : "",
            ],
        ]);
        return redirect('list-sucursal')->with('MensajeGuardar', 'Sucursal ' . $request->input('nombre') . ' se guardo con éxito');
    }

    public function show(sucursal $sucursal)
    {
        //
    }

    public function edit($id_sucursal)
    {

        $row = Sucursal::findOrFail($id_sucursal);
        $empresa = Empresa::all()->where("estado", 1);
        $tipo_doc = TipoDoc::all()->where("estado", 1);
        $departamento = Departamento::all();

        return view('admin.sucursal.editar', ["row" => $row, "tipo_doc" => $tipo_doc, "departamento" => $departamento, "empresa" => $empresa]);
    }

    public function update(Request $request, $id)
    {
        $validator = $this->validate($request, [

            'id_empresa' => 'required',
            'id_tipdoc' => 'required',
            'ruc' => 'required|min:8|max:11',
            'nombre' => 'required|max:250',
            'direccion' => 'required|max:250',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'provincia' => 'required',
            'estado' => 'required',

        ]);

        if ($request->hasFile('imagen')) {
            #trae la data
            $row = Sucursal::findOrFail($id);
            #borro la foto de tal ruta
            #definir use \Storage arriba
            Storage::delete('public/' . $row->imagen);
            #modificando el campo file y almacenar en public/uploads
            #store almacenar fotos
            $imagen = $request->file('imagen')->store('uploads', 'public');

        }

        DB::table('sucursals')
            ->where('id_sucursal', $id)
            ->update([
                'id_empresa' => $request->input('id_empresa') != null ? $request->input('id_empresa') : "",
                'id_tipdoc' => $request->input('id_tipdoc') != "0" ? $request->input('id_tipdoc') : "",
                'nombre' => $request->input('nombre') != null ? $request->input('nombre') : "",
                'ruc' => $request->input('ruc') != null ? $request->input('ruc') : "",
                'direccion' => $request->input('direccion') != null ? $request->input('direccion') : "",
                'telefono' => $request->input('telefono') != null ? $request->input('telefono') : "",
                'departamento' => $request->input('_departamento') != "0" ? $request->input('_departamento') : "",
                'provincia' => $request->input('_provincia') != "0" ? $request->input('_provincia') : "",
                'distrito' => $request->input('_distrito') != "0" ? $request->input('_distrito') : "",
                'correo' => $request->input('correo') != null ? $request->input('correo') : "",
                'imagen' => isset($imagen) ? $imagen : '',
                'estado' => $request->input('estado') != null ? $request->input('estado') : "",
            ]);

        return redirect('list-sucursal')->with('MensajeGuardar', 'Sucursal ' . $request->input('nombre') . ' modificado con éxito');
    }

    public function destroy($id_sucursal)
    {
        #trae la data
        $row = Sucursal::findOrFail($id_sucursal);

        if (Storage::delete('public/' . $row->imagen)) {
            Sucursal::where('id_sucursal', $id_sucursal)->delete();
        }

    }
}
