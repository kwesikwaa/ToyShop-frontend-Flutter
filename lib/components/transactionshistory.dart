import 'package:flutter/material.dart';
import 'package:toyshop/components/transactionhistorydetail.dart';

class TransactionsHistory extends StatelessWidget {
  const TransactionsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransactionHistoryDetail()));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:15,horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(height: 13,width: 13, margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(color:Colors.green,shape: BoxShape.circle),),
                        const SizedBox(width: 40,),
                        const Text('sokjdflsjlfsfds'),
                          ],
                    ),
                    const Text('date and time')
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}