import 'package:flutter/material.dart';
import 'package:toyshop/Models/toy.dart';

class ToyDetail extends StatelessWidget {
  
  final Toy toy;
  const ToyDetail({super.key, required this.toy});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
           FractionallySizedBox(
            heightFactor: 0.5,
            child: Image.asset(toy.thumbnail, fit:BoxFit.cover),
           ),
           Text(toy.name),
           const SizedBox(height: 2),
           Text(toy.description),
           const SizedBox(height: 2),
           Expanded(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite, color: Colors.grey,),
                ElevatedButton(child: const Text('Add to Cart'),
                  onPressed: (){
                    
                  },
                )
              ],
             ),
           )
      ]),
    );
  }
}