// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';



class Payment{
  final String amount;
  final PaystackPlugin plugin;
  final String paykey;

  Payment({ required this.amount, required this.paykey, required this.plugin});

  

  makePayment(context) async{
    final cast = double.parse(amount);
    final pay = (cast*100).round();

    Charge charge = Charge()
      ..amount = pay
      ..reference = 'somereference'
      // ..accessCode = 'someaccesscodegoeshere'
      ..email = 'example@email.com'
      ..currency = 'GHS';

    CheckoutResponse res = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge
    );

    if(res.status){
      final msg = 'Payment was successful. Ref: ${res.reference}';
      successwidget(msg, context);
    }
  }

  successwidget(String message, BuildContext context){
      return showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text(message),
            actions: [
              ElevatedButton(child: const Text('OK'),
                onPressed: (){ Navigator.pop(context);}, 
              )
            ],
          );
        });
  }


}

