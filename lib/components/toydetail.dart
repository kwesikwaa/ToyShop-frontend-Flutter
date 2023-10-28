import 'package:flutter/material.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Models/toymodel.dart';
import 'package:toyshop/Models/wishitem.dart';

class ToyDetail extends StatefulWidget {
  
  final Toy toy;
  const ToyDetail({super.key, required this.toy});

  @override
  State<ToyDetail> createState() => _ToyDetailState();
}

class _ToyDetailState extends State<ToyDetail> {

  int qty =1;


  bool wished(Toy x){
    for(WishItem y in AllToys.wishlist){
      if(y.item.id == widget.toy.id){
        return true;
      }
    }
    return false;
  }

   bool carted(Toy x){
    for(CartItem y in AllToys.cartlist){
      if(y.item.id == x.id){
        return true;
      }
    }
    return false;
  }


  _addtocart(){
     int index = 0;
    bool here = false;
    for(CartItem y in AllToys.cartlist){
      if(y.item.id == widget.toy.id){
        here = true;
        index = AllToys.cartlist.indexOf(y);
        break;
      }
    }

    if(here){
      AllToys.cartlist.removeAt(index);
    }
    else{
      AllToys.cartlist.add(CartItem(item: widget.toy, qty: 1));
    }
  }     
 
  _addtowishlist(){
    int index = 0;
    bool here = false;
    for(WishItem y in AllToys.wishlist){
      if(y.item.id == widget.toy.id){
        here = true;
        index = AllToys.wishlist.indexOf(y);
        break;
      }
    }

    if(here){
      AllToys.wishlist.removeAt(index);
    }
    else{
      AllToys.wishlist.add(WishItem(item: widget.toy, qty: qty));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){Navigator.pop(context);}),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                    width: double.infinity, 
                    height: MediaQuery.of(context).size.height*.55,
                    child: Hero(tag:widget.toy.thumbnail,child: Image.asset(widget.toy.thumbnail, fit:BoxFit.cover)),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.toy.name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text("GHC ${widget.toy.price.toString()}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(widget.toy.description, maxLines: 3, overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5),
                ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      _addtowishlist();
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(5)
                      ),
                        child: Icon(Icons.favorite, color: wished(widget.toy)?Colors.pink:Colors.white,) ,
                      
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text((qty*widget.toy.price).toStringAsFixed(2), style: const TextStyle(fontSize: 25)),
                      // const SizedBox(height: 2),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(qty>1){
                                  qty -=1;
                                }
                              });
                            },
                            child: const Icon(Icons.remove_circle, color: Colors.deepPurple,size: 35,)
                            ),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Center(child: Text(qty.toString(), style: const TextStyle(fontSize: 20),))
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                  qty +=1;
                              });
                            }, 
                            child: const Icon(Icons.add_circle, color: Colors.deepPurple, size: 35,)
                          ),
                        ],
                      ),
            
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      _addtocart();
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Icon(Icons.shopping_basket, color: carted(widget.toy)?Colors.pink: Colors.white,) ,
                      ),
                    ),
                ],
              ),
            ) 
             
        ]),
      ),
    );
  }
}