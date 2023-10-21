import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/toyItem.dart';

class ShopRoute extends StatefulWidget {
  const ShopRoute({super.key});

  @override
  State<ShopRoute> createState() => _ShopRouteState();
}

class _ShopRouteState extends State<ShopRoute> {

  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextField(
              controller: searchCtrl,
            ),
            ElevatedButton(
              child:const Text('Search'),
              onPressed:(){
                if(searchCtrl.text.trim().isNotEmpty){
                  // searchthrough
                }
              })
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1/2
          ),
          itemCount: AllToys.stock.length,
          scrollDirection: Axis.vertical, 
          itemBuilder: (context, index){
            final item = AllToys.stock[index];
            return ToyItem(toy: item); 
          }
        ),
      ]
    );
  }
}