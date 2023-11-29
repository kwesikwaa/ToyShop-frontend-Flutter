// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Models/toymodel.dart';
import 'package:toyshop/Models/wishitem.dart';
import 'package:toyshop/components/toydetail.dart';

class ToyItem extends StatefulWidget {
  final Toy toy;

  const ToyItem({super.key, required this.toy});

  @override
  State<ToyItem> createState() => _ToyItemState();
} 

class _ToyItemState extends State<ToyItem> {
  
  bool wished(Toy x){
    for(WishItem y in AllToys.wishlist){
      if(y.item.id == x.id){
        return true;
      }
    }
    return false;
  }
  
  togglewishlist(Toy thisitem){
    int index = 0;
    bool here = false;
    for(WishItem y in AllToys.wishlist){
      if(y.item.id == thisitem.id){
        here = true;
        index = AllToys.wishlist.indexOf(y);
        break;
      }
    }

    if(here){
      AllToys.wishlist.removeAt(index);
    }
    else{
      AllToys.wishlist.add(WishItem(item: thisitem, qty: 1));
    }
    AllToys.wishtotal.value = AllToys.wishlist.length;
  }
  
  togglecart(Toy thisitem){
    int index = 0;
    bool here = false;
    for(CartItem y in AllToys.cartlist){
      if(y.item.id == thisitem.id){
        here = true;
        index = AllToys.cartlist.indexOf(y);
        break;
      }
    }

    if(here){
      AllToys.cartlist.removeAt(index);
    }
    else{
      AllToys.cartlist.add(CartItem(item: thisitem, qty: 1));
    }
    AllToys.carttotal.value = AllToys.cartlist.length;
  }     
    
  bool carted(Toy x){
    for(CartItem y in AllToys.cartlist){
      if(y.item.id == x.id){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: widget.toy)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  Colors.white,
          boxShadow: const [BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(1, 3)
          )]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:8,right:8,top:8,bottom:8),
          child: Column(
                  children: [
                    Expanded(
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAlias,
                          child: Hero(tag:widget.toy.thumbnail,child: Image.asset(widget.toy.thumbnail, fit: BoxFit.cover,))),
                      ),
                    ),
                    Align(alignment:Alignment.centerLeft,child: Text(widget.toy.name, style: const TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            togglewishlist(widget.toy);
                            // force rebuild for icon
                            setState(() {});
                          },
                          child: Icon(Icons.favorite, color: wished(widget.toy)?Colors.pink[700]:Colors.black38,)),
                        Text("₵ ${widget.toy.price.toString()}", style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black87),),
                        InkWell(
                          onTap: (){
                            togglecart(widget.toy);
                            // force rebuild for icon
                            setState(() {});
                          },
                          child: Icon(Icons.shopping_basket_rounded, color: carted(widget.toy)?Colors.pink[700]:Colors.black38,)),
                      ]
                      
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}