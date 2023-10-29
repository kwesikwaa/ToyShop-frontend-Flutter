import 'package:flutter/material.dart';

class TransactionHistoryDetailExt extends StatelessWidget {
  const TransactionHistoryDetailExt({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                            Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                            Text('Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          ],
                        ),

                        //making these hierrachy was a headache.. ie Singlchild..> column > listview builder
                        // solution was to set shrinkwrap to true, physics to never and column mainaxissize to min
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Items'),
                                Text('Quantity'),
                                Text('Price'),
                              ],
                            );
                          }
                        ),
                        
                        const SizedBox(height: 30,),                     
                        
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sub-Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            Text("₵ xxxxxxxx}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            Text("₵ 10", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            //refactor to permanent representation of total figure
                            Text("₵ XXXXXXXX", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ],
                        ),
                    
                        const SizedBox(height: 20,),
                        Container(height: 3, width: double.infinity,color:Colors.grey,),
                        const SizedBox(height: 20,),
                        const Text('Payment Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        const Text('Payment made via Mobile Money'),
                        const Text('025052505252'),
                        const Text('Momo Name'),
                        const Text('Reference - 4PmJZcfIdEu1zyhH0cSTnZJsg3n7SiY2XgFXNX3wgxCBucs '),
                        const SizedBox(height: 20,),
                        Container(height: 3, width: double.infinity,color:Colors.grey,),
                        
                        const SizedBox(height: 20,),
                        const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        const Text('Address.... \n  nsnndsnfnsdf sd ds f \n skljf shdsl  lkjdsl slkjalkdsl k lk j sls ',maxLines: 3,),
                        const Text('contact 025052505252'),
                      ],
                    ),
    );

                  
  
  }
}