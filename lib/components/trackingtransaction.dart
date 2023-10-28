import 'package:flutter/material.dart';
import 'package:toyshop/components/trackintransactionrealtime.dart';

class TrackingTransaction extends StatelessWidget {
  const TrackingTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Transation ID',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Text('IN PROGRESSS', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Container(height: 3, width: double.infinity,color:Colors.grey,),
            const SizedBox(height: 10,),
            const Expanded(child:TrackingTransactionRealTIme())
            //probably where a listview will replace this

            
          ],
        ),
      ),
    );
  }
}