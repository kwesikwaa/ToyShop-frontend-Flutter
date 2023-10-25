import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/toyItem.dart';
import 'package:toyshop/components/toydetail.dart';

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
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height*.06,
            child: TextField(
              onSubmitted: (value){print('-=-=-=-on done triggered-=-=$value');},
              onEditingComplete: (){print("--=-=entered-=-=- '${searchCtrl.text}' was searched ");},
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                border: OutlineInputBorder(),
                hintText: 'Search Toy'
              ),
                
              controller: searchCtrl,
              
            ),
          ),
          const SizedBox(height:10),
          ElevatedButton(onPressed: (){AllToys.loggedin = !AllToys.loggedin;}, child: const Text('Dummy Login Logoff Switch')),
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
                itemCount: AllToys.upcomings.length,
                itemBuilder: (builder, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: AllToys.upcomings[index])));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 160,
                      child: Image.asset(AllToys.upcomings[index].thumbnail, fit: BoxFit.cover),
                    ),
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