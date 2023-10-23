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
          borderRadius: BorderRadius.circular(6),
          color: Colors.greenAccent.withOpacity(0.2)
        ),
        child: Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(widget.toy.thumbnail),
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Text(widget.toy.name),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.favorite, color: Colors.grey,),
                        onTap: (){},
                      ),
                      Text("#${widget.toy.price.toString()}"),
                      GestureDetector(
                        child: const Icon(Icons.add_shopping_cart_sharp, color: Colors.grey,),
                        onTap: (){},
                      )
                    ]
                  ),
                ],
              ),
      ),
    );
  }
}