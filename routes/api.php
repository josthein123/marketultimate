<?php

// require 'vendor/autoload.php';

// // use App\Carrito;
// // use App\Items;
// use App\Tasas;
// // use App\Venta;
// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;
// use PayPal\Api\Amount;
// use PayPal\Api\Details;
// use PayPal\Api\InputFields;
// use PayPal\Api\Item;
// use PayPal\Api\ItemList;
// use PayPal\Api\Payer;
// use PayPal\Api\Payment;
// use PayPal\Api\PaymentExecution;
// use PayPal\Api\RedirectUrls;
// use PayPal\Api\Transaction;
// use PayPal\Api\WebProfile;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::post('create-payment', function (Request $request) {

//     $venta = DB::select(DB::raw("SELECT u.*,v.* from ventas v inner join users u on v.id_user = u.id where v.estado = 0 and  v.id_user = " . $request->param1 . " and v.code_pago = '" . $request->param2 . "' "));

//     $items = DB::select(DB::raw("SELECT p.nombre,p.precio as p_precio,i.*,p.descuento as p_desc from items i inner join productos p on i.id_prod = p.id_prod where i.id_venta = " . $venta[0]->id_venta));

//     $tasa = Tasas::orderBy('id_tasas', 'desc')->first()->tasa;

//     $apiContext = new \PayPal\Rest\ApiContext(
//         new \PayPal\Auth\OAuthTokenCredential(
//             // Cliente ID
//             'AabiYWaKCjrm1GxZi3EpIBAZUQV-FIP7q2saD5JtkPPWdNBATJUeOOh8eU7Pck7RI0SN8J8HVxoRrO3w',
//             // Cliente Secret
//             'EJi0G2TWM-q1lsyTR_icSaXPLORChAmuEUIy7q91EilvMQgNACu-zmQc_YNpWLw9i5c_k9GLj9VHBdi9'
//         )

//     );
//     $payer = new Payer();
//     $payer->setPaymentMethod("paypal");

//     $count = 0;

//     foreach ($items as $key => $filas) {
//         $item = new Item();
//         $item->setName($filas->nombre)
//             ->setCurrency('USD')
//             ->setQuantity($filas->cantidad)
//             ->setSku("123123") // Similar to `item_number` in Classic API
//             ->setPrice(
//                 number_format((($filas->p_precio - ($filas->p_precio * ($filas->p_desc / 100))) / $tasa) + ($venta[0]->costo_envio / $tasa), 2, '.', ' ')
//             );

//         if ($count == 0) {
//             $_items[] = $item;
//             unset($item);
//             $count++;
//         } else {
//             array_push($_items, $item);
//             unset($item);
//             $count++;
//         }
//         // echo number_format((($filas->p_precio - ($filas->p_precio * ($filas->p_desc / 100))) / $tasa), 3, '.', ' ');die;
//     }

//     // $item1 = new Item();
//     // $item1->setName('sdas')
//     //     ->setCurrency('USD')
//     //     ->setQuantity(1)
//     //     ->setSku("123123") // Similar to `item_number` in Classic API
//     //     ->setPrice(7.5);
//     // $item2 = new Item();
//     // $item2->setName('nombre prod2')
//     //     ->setCurrency('USD')
//     //     ->setQuantity(5)
//     //     ->setSku("321321") // Similar to `item_number` in Classic API
//     //     ->setPrice(2);

//     $itemList = new ItemList();
//     // $itemList->setItems(array($item1, $item2));
//     $itemList->setItems($_items);

//     //echo number_format(($venta[0]->total_dolar + $venta[0]->costo_envio)), 2, '.', ' ';die;
//     $details = new Details();
//     $details->setShipping(0)
//         ->setTax(0)
//         ->setSubtotal(
//             $venta[0]->total_dolar + ($venta[0]->costo_envio / $tasa)
//         );

//     //echo $venta[0]->total_dolar;die;
//     // $details = new Details();
//     // $details->setShipping(1.20)
//     //     ->setTax(1.30)
//     //     ->setSubtotal(17.50);

//     // $amount = new Amount();
//     // $amount->setCurrency("USD")
//     //     ->setTotal(20)
//     //     ->setDetails($details);

//     $amount = new Amount();
//     $amount->setCurrency("USD")
//         ->setTotal(
//             $venta[0]->total_dolar + ($venta[0]->costo_envio / $tasa)
//         )
//         ->setDetails($details);

//     $transaction = new Transaction();
//     $transaction
//         ->setAmount($amount)
//         ->setItemList($itemList)
//         ->setDescription("Descripcion de pago")
//         ->setInvoiceNumber(uniqid());

//     // $baseUrl = getBaseUrl();
//     $baseUrl = "http://localhost/market/venta";
//     $baseUrl_cancel = "http://localhost/market/cancelar";
//     $redirectUrls = new RedirectUrls();
//     //$redirectUrls->setReturnUrl("$baseUrl/ExecutePayment.php?success=true")
//     // ->setCancelUrl("$baseUrl/ExecutePayment.php?success=false");
//     $redirectUrls->setReturnUrl($baseUrl)
//         ->setCancelUrl($baseUrl_cancel);

//     // add no shipping option
//     $inputFields = new InputFields();
//     $inputFields->setNoShipping(1);

//     $webProfile = new WebProfile();
//     $webProfile->setName('test' . uniqid())->setInputFields($inputFields);

//     $payment = new Payment();
//     $payment->setIntent("sale")
//         ->setPayer($payer)
//         ->setRedirectUrls($redirectUrls)
//         ->setTransactions(array($transaction));

//     $request = clone $payment;

//     try {
//         $payment->create($apiContext);
//     } catch (Exception $ex) {

//         /*ResultPrinter::printError("Created Payment Using PayPal. Please visit the URL to Approve.", "Payment", null, $request, $ex);*/
//         echo "Errores:" . $ex;
//         // echo $ex->getCode(); // Prints the Error Code
//         // echo $ex->getData(); // Prints the detailed error message
//         exit(1);
//     }

//     /*$approvalUrl = $payment->getApprovalLink();
//     ResultPrinter::printResult("Created Payment Using PayPal. Please visit the URL to Approve.", "Payment", "<a href='$approvalUrl' >$approvalUrl</a>", $request, $payment);*/

//     return $payment;
// });

// Route::post('execute-payment', function (Request $request) {

//     $apiContext = new \PayPal\Rest\ApiContext(
//         new \PayPal\Auth\OAuthTokenCredential(
//             // Cliente ID
//             'AabiYWaKCjrm1GxZi3EpIBAZUQV-FIP7q2saD5JtkPPWdNBATJUeOOh8eU7Pck7RI0SN8J8HVxoRrO3w',
//             // Cliente Secret
//             'EJi0G2TWM-q1lsyTR_icSaXPLORChAmuEUIy7q91EilvMQgNACu-zmQc_YNpWLw9i5c_k9GLj9VHBdi9'
//         )

//     );

//     $paymentId = $request->paymentID;
//     $payment = Payment::get($paymentId, $apiContext);

//     $execution = new PaymentExecution();
//     $execution->setPayerId($request->payerID);

//     // $transaction = new Transaction();
//     // $amount = new Amount();
//     // $details = new Details();

//     // $details->setShipping(2.2)
//     //     ->setTax(1.3)
//     //     ->setSubtotal(17.50);

//     // $amount->setCurrency('USD');
//     // $amount->setTotal(21);
//     // $amount->setDetails($details);
//     // $transaction->setAmount($amount);

//     // $execution->addTransaction($transaction);

//     try {
//         $result = $payment->execute($execution, $apiContext);

//         // ResultPrinter::printResult("Executed Payment", "Payment", $payment->getId(), $execution, $result);

//         // try {
//         //     $payment = Payment::get($paymentId, $apiContext);
//         // } catch (Exception $ex) {

//         //     ResultPrinter::printError("Get Payment", "Payment", null, null, $ex);
//         //     exit(1);
//         // }
//     } catch (Exception $ex) {
//         // ResultPrinter::printError("Executed Payment", "Payment", null, null, $ex);
//         echo $ex->getCode(); // Prints the Error Code
//         echo $ex->getData(); // Prints the detailed error message
//         exit(1);
//     }

//     // ResultPrinter::printResult("Get Payment", "Payment", $payment->getId(), null, $payment);

//     // return $payment;

//     // ResultPrinter::printResult("User Cancelled the Approval", null);
//     // exit;
//     return $result;
//     //return 'execute payment working';
// });
