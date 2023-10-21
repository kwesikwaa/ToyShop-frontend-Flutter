class Toy{
  String id;
  String name;
  String description;
  double price;
  String thumbnail;
  List<String> images;
  bool available;

  Toy({ 
    required this.id,
    required this.name,
    required this.description,
    required this.available,
    required this.images,
    required this.price,
    required this.thumbnail
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id':id,
      'name':name,
      'description':description,
      'available':available,
      'price':price,
      'thumbnail':thumbnail,
      'images':images
    };
  }

  factory Toy.fromjson(Map<String, dynamic> json){
    // if(json !=null){
    //   return null;
    // }
    return Toy(
      id:json["id"],
      name:json["name"],
      description:json["descritption"],
      available:json["artist"],
      price:json["price"],
      thumbnail:json["thumbnail"],
      images:json["images"]
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// List<Catergories> toyscategory =[
//   Catergories(name: 'character', icon: const Icon(Icons.access_alarms)),
//   Catergories(name: 'vfx', icon: const Icon(Icons.add_alarm)),
//   Catergories(name: 'props', icon: const Icon(Icons.one_k_sharp)),
//   Catergories(name: 'environ', icon: const Icon(Icons.videocam_sharp))
// ];
// class Catergories{
//   String name;
//   Icon icon;

//   Catergories({@required this.name, @required this.icon});
// }