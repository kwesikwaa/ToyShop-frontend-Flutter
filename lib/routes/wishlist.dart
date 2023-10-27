// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/toydetail.dart';

class WishlistRoute extends StatefulWidget {
  const WishlistRoute({super.key});

  @override
  State<WishlistRoute> createState() => _WishlistRouteState();
}

class _WishlistRouteState extends State<WishlistRoute> {
  final wishlist = AllToys.wishlist;

  _movetocart(int index, {int? qty=1}){
    final movethis = wishlist[index];
    final createnew = CartItem(item: movethis.item, qty: qty!);

    bool exists = false;
    int existsAtIndex = 0;

    for(CartItem y in AllToys.cartlist){
      if(y.item.id == movethis.item.id){
        exists = true;
        existsAtIndex = AllToys.cartlist.indexOf(y);
      }
    }

    if(exists){
      if(AllToys.cartlist[existsAtIndex].qty>movethis.qty){
        AllToys.wishlist.removeAt(index);
      }
      else{
        AllToys.cartlist[existsAtIndex].qty = qty;
        AllToys.wishlist.removeAt(index);
      }
      
    }
    else{
      AllToys.cartlist.add(createnew);

    }
  }
  

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: wishlist[index].item)));
              },
              child: Card(
                child: ListTile(
                  title: Container(
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(wishlist[index].item.name,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text(wishlist[index].item.price.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    if(wishlist[index].qty>1){
                                      wishlist[index].qty -=1;
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20))),
                                  backgroundColor: Colors.deepPurple
                                ),
                                child: const Text('')
                                ),
                            ),
                            Container(
                              width: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text(wishlist[index].qty.toString()))
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                      wishlist[index].qty +=1;
                                  });
                                }, 
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20))),
                                  backgroundColor: Colors.deepPurple
                                ),
                                child: const Text('')
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  leading: Hero(
                    tag:wishlist[index].item.thumbnail,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(wishlist[index].item.thumbnail))),
                  trailing:ElevatedButton(
                      onPressed: (){
                        _movetocart(index,qty: wishlist[index].qty);
                        setState(() {
                          
                        });
                        
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.deepPurple
                      ),
                      child: const Icon(Icons.shopping_basket) ,
                    ) ,
                ),
              ),
            ),
          );
        }),
    );
  }
}