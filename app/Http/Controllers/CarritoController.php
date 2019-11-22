<?php

namespace App\Http\Controllers;

use App\Carrito;
use App\Tasas;
use App\Venta;
use Auth;
use DB;
use Illuminate\Http\Request;

//Config::get('config.opcion');

class CarritoController extends Controller
{

    public function index()
    {
        $micarro = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id_user =" . auth()->user()->id));

        $totales = DB::select(DB::raw("SELECT sum( c.cantidad *(p.precio -(p.precio * (p.descuento / 100))) ) as total,
        sum( c.cantidad *(p.precio *((p.descuento / 100))) ) as descuento,
        sum( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) as subtotal,
        sum( ( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) * 0.18 ) as igv
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id_user =" . auth()->user()->id));

        $tasa = Tasas::orderBy('id_tasas', 'desc')->first()->tasa;
        //
        // si tengo registros en ventas en estado 0 (no pago, paso final)
        //
        $ventas = Venta::where('estado', 0)->where('id_user', auth()->user()->id)->count();
        if ($ventas > 0) {
            return redirect('/venta');
        } else {
            return view('admin.carrito.index', [
                "micarro" => $micarro,
                "totales" => $totales,
                "tasa" => $tasa,
                "config" => "20.00",
            ]);
        }

    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {

        $validator = $this->validate($request, [
            'id_user' => 'required',
            'id_prod' => 'required',
            'cantidad' => 'required',
        ]);
        $carrito = request()->except('_token', '_method');

        #consulto las filas
        $car = DB::select(DB::raw("SELECT cantidad as cant FROM carritos WHERE  id_user = " . $request->input('id_user') . " AND id_prod = " . $request->input('id_prod') . " "));
        $prod_stock = DB::select(DB::raw("SELECT stock FROM productos WHERE id_prod = " . $request->input('id_prod') . " "));

        #validacion insertar
        if (count($car) == 0 && $request->input('cantidad') <= $prod_stock[0]->stock) {
            Carrito::insert($carrito);
            /*ACTUALIZA EL STOCK PRODUCTO*/
            DB::table('productos')
                ->where('id_prod', $request->input('id_prod'))
                ->update([
                    'stock' => $prod_stock[0]->stock - $carrito['cantidad'],
                ]);
            /**/
            $data = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . auth()->user()->id));
        } else {

            #actualiza
            if ($request->input('cantidad') <= $prod_stock[0]->stock) {

                /*ACTUALIZA EL STOCK PRODUCTO*/
                DB::table('productos')
                    ->where('id_prod', $request->input('id_prod'))
                    ->update([
                        'stock' => $prod_stock[0]->stock - $carrito['cantidad'],
                    ]);
                /**/
                $carrito['cantidad'] = $car[0]->cant + $request->input('cantidad');
                Carrito::where('id_user', $request->input('id_user'))->where('id_prod', $request->input('id_prod'))->update($carrito);

                $data = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
                from carritos c inner join users u
                on c.id_user = u.id inner join productos p
                on c.id_prod = p.id_prod
                where c.id_user =" . auth()->user()->id));

            } else {
                $data = [
                    "mensaje" => "llenito",
                ];
            }

        }
        echo json_encode($data);

    }

    public function show(Carrito $carrito)
    {
        //
    }

    public function edit(Carrito $carrito)
    {
        //
    }

    public function update(Request $request, $idcar)
    {
        $producto_carrito = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id =" . $idcar));

        if ($producto_carrito[0]->cant > $request->input('cant')) {
            $stock = ($producto_carrito[0]->cant - $request->input('cant')) + $producto_carrito[0]->stock;
        } else {
            $stock = $producto_carrito[0]->stock - ($request->input('cant') - $producto_carrito[0]->cant);
        }

        if ($stock >= 0 && $request->input('cant') > 0) {
            DB::table('productos')
                ->where('id_prod', $request->input('idprod'))
                ->update([
                    'stock' => $stock,
                ]);
            DB::table('carritos')
                ->where('id', $idcar)
                ->update([
                    'cantidad' => $request->input('cant') == null ? "0" : $request->input('cant'),
                ]);
            $producto_carrito = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user=" . auth()->user()->id));

            $totales = DB::select(DB::raw("SELECT sum( c.cantidad *(p.precio -(p.precio * (p.descuento / 100))) ) as total,
            sum( c.cantidad *(p.precio *((p.descuento / 100))) ) as descuento,
            sum( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) as subtotal,
            sum( ( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) * 0.18 ) as igv
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . auth()->user()->id));

            $tasa = Tasas::orderBy('id_tasas', 'desc')->first()->tasa;

            $data = [
                "fila" => $producto_carrito,
                "totales" => $totales,
                "tasa" => $tasa,
            ];

        } else {
            $data = [
                "mensaje" => "llenito",
            ];
        }

        echo json_encode($data);
    }

    public function destroy($id)
    {
        $producto_carrito = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id =" . $id));

        /*ACTUALIZA EL STOCK PRODUCTO*/
        DB::table('productos')
            ->where('id_prod', $producto_carrito[0]->id_prod)
            ->update([
                'stock' => $producto_carrito[0]->stock + $producto_carrito[0]->cant,
            ]);
        /**/
        Carrito::destroy($id);

        $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id_user =" . auth()->user()->id));

        $totales = DB::select(DB::raw("SELECT sum( c.cantidad *(p.precio -(p.precio * (p.descuento / 100))) ) as total,
        sum( c.cantidad *(p.precio *((p.descuento / 100))) ) as descuento,
        sum( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) as subtotal,
        sum( ( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) * 0.18 ) as igv
        from carritos c inner join users u
        on c.id_user = u.id inner join productos p
        on c.id_prod = p.id_prod
        where c.id_user =" . auth()->user()->id));

        $tasa = Tasas::orderBy('id_tasas', 'desc')->first()->tasa;

        $data = [
            "fila" => $car,
            "totales" => $totales,
            "tasa" => $tasa,
        ];

        echo json_encode($data);

    }
}
