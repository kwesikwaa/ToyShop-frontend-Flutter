import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Models/transactionshistorymodel.dart';
import 'package:toyshop/components/transactionhistorydetail.dart';

class TransactionsHistory extends StatelessWidget {
  

  const TransactionsHistory({super.key, required this.history});
  
  // change this 
  
  final List<TransactionsHistoryModel> history;

  Color _getcolour(String status){
    switch(status){
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistoryDetail(history:history[index])));
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getcolour(history[index].status)
                          ),
                        ),
                        const SizedBox(width: 40,),
                        Text(history[index].id),
                          ],
                    ),
                    Text(history[index].datetime)
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