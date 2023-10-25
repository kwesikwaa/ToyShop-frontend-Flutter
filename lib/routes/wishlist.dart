import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/toydetail.dart';

class WishlistRoute extends StatefulWidget {
  const WishlistRoute({super.key});

  @override
  State<WishlistRoute> createState() => _WishlistRouteState();
}

class _WishlistRouteState extends State<WishlistRoute> {
  final wishlist = AllToys.wishlist;

  

  @override
  Widget build(BuildContext context) {
    bool nothing = wishlist.isEmpty;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: nothing?const Center(child: Text('No wishes yes, make a wish'),):ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context,index){
          
          return Dismissible(
            onDismissed: (DismissDirection dir){
              setState(() {
                wishlist.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              child: const Align(alignment: Alignment.centerLeft, child: Icon(Icons.delete)),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: const Align(alignment: Alignment.centerRight, child: Icon(Icons.delete)),
            ),
            key: UniqueKey(),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: wishlist[index])));
              },
              child: Card(
                child: ListTile(
                  title:Text(wishlist[index].name),
                  leading: Hero(tag:wishlist[index].thumbnail,child: CircleAvatar(radius: 25, backgroundImage: AssetImage(wishlist[index].thumbnail))),
                  trailing: Text(wishlist[index].price.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                ),
              ),
            ),
          );
        }),
    );
  }
}