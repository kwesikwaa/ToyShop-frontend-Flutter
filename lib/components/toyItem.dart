import 'package:flutter/material.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Models/toymodel.dart';
import 'package:toyshop/components/toydetail.dart';

class ToyItem extends StatefulWidget {
  final Toy toy;

  const ToyItem({super.key, required this.toy});

  @override
  State<ToyItem> createState() => _ToyItemState();
} 

class _ToyItemState extends State<ToyItem> {
  
  bool wished(Toy x){
    final y = AllToys.wishlist.contains(x);
    return y;
  }
  
  togglewishlist(Toy wishtoy){
    if(AllToys.wishlist.contains(wishtoy)){
      AllToys.wishlist.remove(wishtoy);
    }
    else{
      AllToys.wishlist.add(wishtoy);
    }
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
        width: MediaQuery.of(context).size.width/2,
        // height: MediaQuery.of(context).size.height/3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 213, 221, 228)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                  children: [
                    Flexible(
                      // height: 140,
                      // width: double.infinity,
                      child: Hero(tag:widget.toy.thumbnail,child: Image.asset(widget.toy.thumbnail)),
                    ),
                    Text(widget.toy.name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            togglewishlist(widget.toy);
                            // force rebuild for icon
                            setState(() {});
                          },
                          icon: Icon(Icons.favorite, color: wished(widget.toy)?Colors.red:Colors.grey,)),
                        Text("#${widget.toy.price.toString()}", style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                        IconButton(
                          onPressed: (){
                            togglecart(widget.toy);
                            // force rebuild for icon
                            setState(() {});
                          },
                          icon: Icon(Icons.add_shopping_cart_sharp, color: carted(widget.toy)?Colors.green:Colors.grey,)),
                      ]
                      
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}