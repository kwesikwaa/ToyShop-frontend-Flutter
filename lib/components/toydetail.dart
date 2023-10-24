import 'package:flutter/material.dart';
import 'package:toyshop/Models/toymodel.dart';

class ToyDetail extends StatelessWidget {
  
  final Toy toy;
  const ToyDetail({super.key, required this.toy});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){Navigator.pop(context);}),
      ),
      body:Column(
        children: [
           Expanded(
             child: FractionallySizedBox(
              heightFactor: 0.5,
              child: Hero(tag:toy.thumbnail,child: Image.asset(toy.thumbnail, fit:BoxFit.cover)),
             ),
           ),
           Text(toy.name),
           const SizedBox(height: 2),
           Text(toy.description),
           const SizedBox(height: 2),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.favorite, color: Colors.grey,),
              ElevatedButton(child: const Text('Add to Cart'),
                onPressed: (){
                  
                },
              )
            ],
           )
      ]),
    );
  }
}