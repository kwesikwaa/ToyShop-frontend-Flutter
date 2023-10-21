import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  
  final _formKey = GlobalKey<FormState>();
  final amountCtrl = TextEditingController();

  String message = '';
  final plugin = PaystackPlugin();
  final paystackkey = 'pk_test_0e0a3ee77f7c00b35972173c6c8a7a57ea83d531';

  makePayment() async{
    int price = int.parse(amountCtrl.text) * 100;
    // ignore: avoid_print
    print('price is ${price.toString()}');

    Charge charge = Charge()
      ..amount = price
      ..reference = 'somereference'
      // ..accessCode = 'someaccesscodegoeshere'
      ..email = 'example@email.com'
      ..currency = 'GHS';
    
    // var paymentmethod = method=='card'?CheckoutMethod.card:CheckoutMethod.bank;

    CheckoutResponse res = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge
    );

    if(res.status){
      message = 'Payment was successful. Ref: ${res.reference}';
      successwidget(message);
    }
  }

  successwidget(String message){
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Payment()));
       Navigator.push(context,MaterialPageRoute(builder:(context)=>const Payment()));
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

  @override
  void initState() {
    plugin.initialize(publicKey: paystackkey);
    super.initState();
  }


  @override
  void dispose() {
    amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Make Payment')
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: amountCtrl,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter and amount';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: const Text('Make Payment'),
                  onPressed: (){
                    if(amountCtrl.text.trim().isNotEmpty){
                      makePayment();
                    }
                    else{print('noting');}
                    // successwidget("Payment Successful ! Please shop with us again");
                  },
                )
              ],
            )
          ),
        )
      )
    );
  }
}