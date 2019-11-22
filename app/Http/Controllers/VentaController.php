<?php

namespace App\Http\Controllers;

use App\Carrito;
use App\Categoria;
use App\Item;
use App\Tasas;
use App\Venta;
use DB;
use Illuminate\Http\Request;

class VentaController extends Controller
{

    public function index()
    {

        $totales = Venta::where('estado', 0)->where('id_user', auth()->user()->id)->orderBy('id_venta', 'desc')->get();

        $cant_ventas = Venta::where('estado', 0)->where('id_user', auth()->user()->id)->count();

        if ($cant_ventas > 0) {
            return view('admin.venta.index', [
                "v_totales" => $totales,
            ]);
        } else {
            return redirect('/carrito');
        }

    }

    public function venta_verificacion($paymentToken, $paymentID)
    {
        //sandbox
        $ClientID = "AabiYWaKCjrm1GxZi3EpIBAZUQV-FIP7q2saD5JtkPPWdNBATJUeOOh8eU7Pck7RI0SN8J8HVxoRrO3w";
        $Secret = "EJi0G2TWM-q1lsyTR_icSaXPLORChAmuEUIy7q91EilvMQgNACu-zmQc_YNpWLw9i5c_k9GLj9VHBdi9";

        //production soto
        //$ClientID = "AbYf-lce1XsdoLRSe_fsvMeWTaMqOVSqXMvlYY5hWdyZEn_MH-T6M23emq223HtxYj_tnfVkUKqbz5c8";
        //$Secret = "EJY7L7ZXykkVVU_J74V_jlJUGvIN9O0w2fj1uZ1OUrvp1MfxqAeDhCYvYlGxWnO7mQP-5jaENSChAont";

        // sandbox
        $apiRest = "https://api.sandbox.paypal.com";
        // production
        //  $apiRest =  "https://api.paypal.com";
        // url sandbox

        $url = $apiRest . "/v1/oauth2/token";

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERPWD, $ClientID . ":" . $Secret);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
        $response = curl_exec($ch);

        $objRespuesta = json_decode($response);
        #obtener el access token
        $Access_token = $objRespuesta->access_token;
        ###
        #consultar la informacion de ese pago
        $Venta = curl_init($apiRest . "/v1/payments/payment/" . $paymentID);

        #obtener toda la informacion de esa venta
        curl_setopt($Venta, CURLOPT_HTTPHEADER, array("Content-Type: application/json", "Authorization: Bearer " . $Access_token));
        curl_setopt($Venta, CURLOPT_RETURNTRANSFER, true);
        $RespuestaVenta = curl_exec($Venta);

        $objDatosTransaccion = json_decode($RespuestaVenta);

        $state = $objDatosTransaccion->state;
        $email = $objDatosTransaccion->payer->payer_info->email;

        $total = $objDatosTransaccion->transactions[0]->amount->total;
        $currency = $objDatosTransaccion->transactions[0]->amount->currency;
        $custom = $objDatosTransaccion->transactions[0]->custom;

        curl_close($Venta);
        curl_close($ch);

        $explode = explode("#", $custom);
        $idVenta = $explode[0];
        $codePago = $explode[1];

        //var_dump($RespuestaVenta);die;

        if ($state == "approved") {
            $this->update_venta($idVenta, $RespuestaVenta, $codePago, $total);
        } else {
            echo "<h3>Hay un problema con el pago de paypal</h3>";die;
        }
        return view('admin.venta.listo');

    }

    public function update_venta($ID, $RESPUESTAVENTA, $CODE_PAGO, $TOTAL_)
    {
        $venta = Venta::where('id_venta', $ID)->first();

        $totalDolar = $venta['total_dolar'];
        $costoEnvioDolar = $venta['costo_envio'] / $venta['tasa_ac'];
        $totalTotal = number_format($totalDolar + $costoEnvioDolar, 2, '.', ' ');

        $affectedRows = Venta::where('id_venta', $ID)
            ->update(array(
                'paypal_datos' => $RESPUESTAVENTA,
                'estado' => 2,
            ));

        if ($TOTAL_ == $totalTotal) {
            $affectedRows = Venta::where('id_venta', $ID)->where('code_pago', $CODE_PAGO)
                ->update(array(
                    'estado' => 1,
                ));
            Carrito::where('id_user', $venta['id_user'])->delete();

        }

    }

    public function list_ventas()
    {
        $car = array();

        if (auth()->user()) {
            $car = DB::select(DB::raw("SELECT c.id,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as subt,c.cantidad as cant,p.*
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . auth()->user()->id));
        }
        $slider_c = "SELECT p.*,c.id_cat
        from slider_categorias sc inner join productos p
        on sc.id_prod = p.id_prod inner join subcategorias subc
        on p.id_subcat = subc.id_subcat inner join categorias c
        on subc.id_cat = c.id_cat";
        $sc = DB::select(DB::raw($slider_c));
        $cat = Categoria::where('estado', 1)->get();

        $ventas = Venta::orderBy('id_venta', 'desc')->where('id_user', auth()->user()->id)->where('estado', '<>', 0)->get();

        return view('admin.venta.list_ventas', [
            "cat" => $cat,
            "slider_c" => $sc,
            "car" => $car,
            "ventas" => $ventas,

        ]);
    }

    public function list_items(Request $request)
    {
        $items = "SELECT p.nombre,p.imagen,v.tasa_ac,i.*
        from ventas v inner join items i
        on i.id_venta = v.id_venta inner join productos p
        on i.id_prod = p.id_prod
        where i.id_venta = " . $request->input("id") . " and v.id_user = " . auth()->user()->id;
        $items_ = DB::select(DB::raw($items));

        echo json_encode($items_);

    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $dataVenta = request()->except('_token');

        $car = DB::select(DB::raw("SELECT cantidad as cant FROM carritos WHERE  id_user = " . auth()->user()->id . " "));

        $tasa = Tasas::orderBy('id_tasas', 'desc')->first()->tasa;
        if (count($car) > 0) {

            $totales = DB::select(DB::raw("SELECT sum( c.cantidad *(p.precio -(p.precio * (p.descuento / 100))) ) as total,
            sum( c.cantidad *(p.precio *((p.descuento / 100))) ) as descuento,
            sum( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) as subtotal,
            sum( ( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) * 0.18 ) as igv
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user =" . auth()->user()->id));

            $validator = $this->validate($request, [

                'tipo_entrega' => 'required',
                'direccion' => 'required|max:250',
                'fecha_envio' => 'required',
                'recepcion' => 'required|max:250',

            ]);

            $id = DB::table('ventas')->insertGetId([
                // [
                'tipo_entrega' => $request->input('tipo_entrega') != null ? $request->input('tipo_entrega') : "",
                'direccion' => $request->input('direccion') != null ? $request->input('direccion') : "",
                'fecha_envio' => $request->input('fecha_envio') != null ? $request->input('fecha_envio') : "",
                'recepcion' => $request->input('recepcion') != null ? $request->input('recepcion') : "",
                'tasa_ac' => $tasa,
                'id_user' => auth()->user()->id != null ? auth()->user()->id : "666",
                'total' => $totales[0]->total != null ? $totales[0]->total : "0.01",
                'total_descuento' => $totales[0]->descuento != null ? $totales[0]->descuento : "0.01",
                // siempre habra una tasa
                // tbconfig->tasa
                'total_dolar' => ($totales[0]->total) / $tasa != "0" ? ($totales[0]->total) / $tasa : "",
                // tbconfig->costo_envio
                'costo_envio' => $request->input('tipo_entrega') == 1 ? 20 : 0,
                //decrypt
                'code_pago' => encrypt(auth()->user()->id . '|' . $totales[0]->total . '|' . date("Y-m-d h:i:s")),
                'estado' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                //],
            ]);

            $carrito = DB::select(DB::raw("SELECT  p.precio,c.cantidad,p.id_prod,c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))  as total,
            c.cantidad *(p.precio *((p.descuento / 100)))  as descuento,
            (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18  as subtotal,
            ( (c.cantidad *(p.precio -(p.precio * (p.descuento / 100)))) / 1.18 ) * 0.18  as igv
            from carritos c inner join users u
            on c.id_user = u.id inner join productos p
            on c.id_prod = p.id_prod
            where c.id_user = " . auth()->user()->id));

            $cant_carrito = Carrito::where('id_user', auth()->user()->id)->count();

            for ($i = 0; $i < $cant_carrito; $i++) {

                DB::table('items')->insert([
                    [
                        'id_venta' => $id,
                        'id_prod' => $carrito[$i]->id_prod,
                        'precio' => $carrito[$i]->precio,
                        'cantidad' => $carrito[$i]->cantidad,
                        'subt' => $carrito[$i]->subtotal,
                        'igv' => $carrito[$i]->igv,
                        'total' => $carrito[$i]->total,
                        'descuento' => $carrito[$i]->descuento,
                        'created_at' => date("Y-m-d h:i:s"),
                    ],
                ]);
            }
        }
        //sleep(2);

        return redirect('/venta');
    }

    public function show(Venta $venta)
    {
        //
    }

    public function edit(Venta $venta)
    {
        //
    }

    public function update(Request $request, Venta $venta)
    {
        //
    }

    public function destroy($id)
    {
        Item::where('id_venta', $id)->delete();
        //sleep(1);
        Venta::where('id_venta', $id)->where('estado', 0)->delete();
        //sleep(1);
        return redirect('/carrito');
    }
}
