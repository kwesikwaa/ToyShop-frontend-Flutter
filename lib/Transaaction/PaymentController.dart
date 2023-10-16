// import 'package:flutter_paystack/flutter_paystack.dart';

// String message = '';


// makePayment(String method) async{
//   int price = int.parse('10000') * 100;

//   Charge charge = Charge()
//     ..amount = price
//     ..reference = 'somereference'
//     ..email = 'email controller'
//     ..currency = 'GHS';
  
//   // var paymentmethod = method=='card'?CheckoutMethod.card:CheckoutMethod.bank;

//   CheckoutResponse res = await plugin.checkout(
//     context,
//     method: CheckoutMethod.selectable,
//     charge: charge
//   );

//   if(res.status){
//     message = 'Payment was successful. Ref: ${res.reference}';
        
//   }
// }