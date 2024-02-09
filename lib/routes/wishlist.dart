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

  _shortnotifier(String message){
    showDialog(context: context, 
    builder: (context)=>AlertDialog(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Row(children:[const Icon(Icons.check_circle_outline, color: Colors.white,),const SizedBox(width:10),Expanded(child: Text(message,maxLines: 3, style: const TextStyle(color: Colors.white),))]),
      backgroundColor: Colors.black87,
      
    )
    
    );
    
  }

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
        AllToys.wishtotal.value = AllToys.wishlist.length;
        _shortnotifier('Item already exists in the cart and will now be removed form wishlist');
      }
      else{
        AllToys.cartlist[existsAtIndex].qty = qty;
        AllToys.wishlist.removeAt(index);
        AllToys.wishtotal.value = AllToys.wishlist.length;
        _shortnotifier('Item already exists in the cart but quantity update has been made');
      }
      
    }
    else{
      AllToys.cartlist.add(createnew);
      AllToys.wishlist.removeAt(index);
      AllToys.wishtotal.value = AllToys.wishlist.length;
      _shortnotifier('Successfully added to cart!');

    }
  }
  

  @override
  Widget build(BuildContext context) {
    bool nothing = wishlist.isEmpty;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: nothing?const Center(child: Text('no wishes yet. make a wish'),):ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context,index){
          
          return Dismissible(
            onDismissed: (DismissDirection dir){
              setState(() {
                wishlist.removeAt(index);
                AllToys.wishtotal.value = AllToys.wishlist.length;
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
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(wishlist[index].qty>1){
                                    wishlist[index].qty -=1;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove_circle, color: Colors.black87,)
                              ),
                            Container(
                              width: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text(wishlist[index].qty.toString()))
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                    wishlist[index].qty +=1;
                                });
                              }, 
                              child: const Icon(Icons.add_circle, color: Colors.black87)
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
                        backgroundColor: Colors.black87
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