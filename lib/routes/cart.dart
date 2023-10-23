import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';

class CartRoute extends StatefulWidget {
  const CartRoute({super.key});

  @override
  State<CartRoute> createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {
  
  final cart = AllToys.cartlist;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index){
              return ListTile(
                title:Text(cart[index].name),
                subtitle: Text(cart[index].price.toString()),
                leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(cart[index].thumbnail)),
                trailing: Row(children: [
                  ElevatedButton(onPressed:(){}, child: const Text('+')),
                  const Text('0'),
                  ElevatedButton(onPressed:(){}, child: const Text('-'))
                ],),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text("GHC 101", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ElevatedButton(child: const Text('Check Out'),onPressed: (){},)
            ],)
        ],
      ),
    );
  }
}