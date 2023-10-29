import 'package:flutter/material.dart';
import 'package:toyshop/Models/transactionshistorymodel.dart';
import 'package:toyshop/components/transactionhistorydetailext.dart';

class TransactionHistoryDetail extends StatelessWidget {
  final TransactionsHistoryModel history;
  const TransactionHistoryDetail({super.key, required this.history});

  Color _getcolour(){
    switch(history.status){
      case "completed":
        return Colors.green;
      case "in progress":
        return Colors.orange;
      case "unsuccessful":
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){Navigator.pop(context);}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(history.id, style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text(history.status, style: TextStyle(color: _getcolour(),fontWeight: FontWeight.bold),),
                  Text(history.datetime),
                  const SizedBox(height: 5,),
                  Container(height: 3, width: double.infinity,color:Colors.grey,),
                  const SizedBox(height: 10,),
                  const Expanded(child: TransactionHistoryDetailExt(),)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.deepPurple
                ),
                child: const Text('Download Receipt')
              ),
            )
          ]),
      ),
    );
  }
}