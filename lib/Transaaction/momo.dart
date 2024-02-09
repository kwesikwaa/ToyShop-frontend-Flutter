import 'dart:convert';
import 'package:flutter/foundation.dart';
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
  final String authorizationUrl;
  final String accessCode;
  final String reference;

  PayStackAuth({required this.authorizationUrl, required this.accessCode, required this.reference});

  factory PayStackAuth.fromJson(Map<String,dynamic> json){
    return PayStackAuth(
      authorizationUrl:json['authorization_url'],
      accessCode: json['access_code'],
      reference: json['reference']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'authorization_url':authorizationUrl,
      'access_code': accessCode,
      'reference': reference
    };
  }
}

Future<PayStackAuth> createTransaction(Momo momo) async{
  const String url = 'https://api.paystack.co/transaction/initialize';
  final data = momo.toJson();
 
  try{
    debugPrint('inside createTransaction try');
    final res = await http.post(
      Uri.parse(url),
      headers:{
        'Authorization': 'Bearer $APIKEY',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(data)
    );
    
    debugPrint('=-=-=-=--=- done resing');

    if(res.statusCode == 200){
      
      debugPrint('-=-=-=-= inside 200');
      
      final data = jsonDecode(res.body);
      return PayStackAuth.fromJson(data['data']);
    }
    else{
      debugPrint('connection successful but a ${res.statusCode}');
      throw res.body;
    }
  } on Exception{
    debugPrint('inside exception now');
      throw 'Connection Failed';
  }
}

//make ref and email args
Future<String> initializePayment(String amount) async{
  
  try{
    String email = 'example@gmail.com';
    String reference = DateTime.now().toString();
    final price = double.parse(amount);
    final pay = (price*100).round();
    final momo = Momo(amount: pay.toString(), reference: reference, currency: 'GHS', email: email);
    
    debugPrint('-=-=-=-=-=-=-=- $pay');
    debugPrint('about to create tansaction');
    final res = await createTransaction(momo);
    debugPrint('done ressing');
    return res.authorizationUrl;
  }catch(e){
    debugPrint('Error initializing payment');
    debugPrint(e.toString());
    return e.toString(); 
  }
}





  