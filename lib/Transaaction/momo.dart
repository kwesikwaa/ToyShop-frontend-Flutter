import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toyshop/Models/env.dart';


class Momo{
  final String amount;
  final String reference;
  final String currency;
  final String email;

  Momo({required this.amount, required this.reference, required this.currency, required this.email});

  factory Momo.fromJson(Map<String,dynamic> json){
    return Momo(
      amount: json['amount'],
      reference: json['reference'],
      currency: json['currency'],
      email: json['email']
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'amount':amount,
      'reference':reference,
      'currency':currency,
      'email':email
    };
  }
}


class PayStackAuth{
  final String authorization_url;
  final String access_code;
  final String reference;

  PayStackAuth({required this.authorization_url, required this.access_code, required this.reference});

  factory PayStackAuth.fromJson(Map<String,dynamic> json){
    return PayStackAuth(
      authorization_url:json['authorization_url'],
      access_code: json['access_code'],
      reference: json['reference']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'authorization_url':authorization_url,
      'access_code': access_code,
      'reference': reference
    };
  }
}

Future<PayStackAuth> createTransaction(Momo momo) async{
  const String url = 'https://api.paystack.co/transaction/initialize';
  final data = momo.toJson();
 
  try{
    final res = await http.post(
      Uri.parse(url),
      headers:{
        'Authorization': 'Bearer $APIKEY',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(data)
    );
    print('=-=-=-=--=- done resing');
    if(res.statusCode == 200){
      print('-=-=-=-= inside 200');
      final data = jsonDecode(res.body);
      return PayStackAuth.fromJson(data['data']);
    }
    else{
      throw 'Payment Unsuccessful';
    }
  } on Exception{
      throw 'Connection Failed';
  }
}

//make ref and email args
Future<String> initializePayment(String amount) async{
  
  try{
    String email = 'example@gmail.com';
    String reference = 'somereference';
    final price = double.parse(amount);
    final pay = (price*100).round();
    final momo = Momo(amount: pay.toString(), reference: reference, currency: 'GHS', email: email);
    print('-=-=-=-=-=-=-=- $pay');
    final res = await createTransaction(momo);
    return res.authorization_url;
  }catch(e){
    print('Error initializing payment');
    print(e);
    return e.toString(); 
  }
}





  