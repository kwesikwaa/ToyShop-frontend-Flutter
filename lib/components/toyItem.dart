import 'package:flutter/material.dart';
import 'package:toyshop/Models/toymodel.dart';
import 'package:toyshop/components/toydetail.dart';

class ToyItem extends StatefulWidget {
  final Toy toy;

  const ToyItem({super.key, required this.toy});

  @override
  State<ToyItem> createState() => _ToyItemState();
} 

class _ToyItemState extends State<ToyItem> {

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: widget.toy)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width/2,
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
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, color: Colors.grey,)),
                        Text("#${widget.toy.price.toString()}", style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart_sharp, color: Colors.grey,)),
                      ]
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}