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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            
            children: [
              // TextField(
                
              //   controller: searchCtrl,
                
              // ),
              ElevatedButton(
                child:const Text('Search'),
                onPressed:(){
                  if(searchCtrl.text.trim().isNotEmpty){
                    // searchthrough
                  }
                })
            ],
          ),
          const SizedBox(height:10),
          const Align(alignment:Alignment.centerLeft,child: Text('Upcoming',style: TextStyle(fontWeight: FontWeight.bold),)),
          const SizedBox(height:5),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.25,
            child: Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 10,
              radius: const Radius.circular(15),
              interactive: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AllToys.cartlist.length,
                itemBuilder: (builder, index){
                  return Container(
                    margin: const EdgeInsets.only(right: 8, bottom: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 160,
                    child: Image.asset(AllToys.cartlist[index].item.thumbnail, fit: BoxFit.cover),
                  );
                }),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85
              ),
              itemCount: AllToys.stock.length,
              scrollDirection: Axis.vertical, 
              itemBuilder: (context, index){
                final item = AllToys.stock[index];
                return ToyItem(toy: item); 
              }
            ),
          ),
        ]
      ),
    );
  }
}