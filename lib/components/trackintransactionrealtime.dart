import 'package:flutter/material.dart';

class TrackingTransactionRealTIme extends StatefulWidget {
  const TrackingTransactionRealTIme({super.key});

  @override
  State<TrackingTransactionRealTIme> createState() => _TrackingTransactionRealTImeState();
}

class _TrackingTransactionRealTImeState extends State<TrackingTransactionRealTIme> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(color:Colors.green,shape: BoxShape.circle),),
                const SizedBox(width: 40,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    Text('PaymentStatus', style: TextStyle(),),
                    Text('Date & Time', style: TextStyle(),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(color:Colors.green,shape: BoxShape.circle),),
                const SizedBox(width: 40,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Items Packaged', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    Text('Packaged and picked up Status', style: TextStyle(),),
                    Text('Date & Time', style: TextStyle(),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(color:Colors.orange,shape: BoxShape.circle),),
                const SizedBox(width: 40,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dispatch', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    Text('Getting ready for dispatch', style: TextStyle(),),
                    Text('Date & Time', style: TextStyle(),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(color:Colors.grey,shape: BoxShape.circle),),
                const SizedBox(width: 40,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    Text('Receipient Name', style: TextStyle(),),
                    Text('Receipient Address', maxLines: 3, style: TextStyle(),),
                    Text('Receipient Address  22', maxLines: 3, style: TextStyle(),),
                    Text('Receipient contact', style: TextStyle(),),
                    Text('Not delivered yet', style: TextStyle(),),
                    Text('date & time', style: TextStyle(),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(color:Colors.grey,shape: BoxShape.circle),),
                const SizedBox(width: 40,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Successful Deliver', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    Text('deliver successufly made', style: TextStyle(),),
                    Text('date & time', style: TextStyle(),)
                  ],
                )
              ],
            )            
          ],
        )
      
    );
  }
}