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
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 213, 221, 228),
          // boxShadow: [BoxShadow(
          //   color: Colors.grey.withOpacity(0.3),
          //   spreadRadius: 2,
          //   blurRadius: 3,
          //   offset: Offset(0, 3)
          // )]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:8,right:8,top:8,bottom:0),
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
                    Align(alignment:Alignment.centerLeft,child: Text(widget.toy.name, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
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
                        Text("₵ ${widget.toy.price.toString()}", style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                        IconButton(
                          onPressed: (){
                            togglecart(widget.toy);
                            // force rebuild for icon
                            setState(() {});
                          },
                          icon: Icon(Icons.shopping_basket_rounded, color: carted(widget.toy)?Colors.green:Colors.grey,)),
                      ]
                      
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}