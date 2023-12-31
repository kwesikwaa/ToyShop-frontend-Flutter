import 'package:flutter/material.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/toymodel.dart';
import 'package:toyshop/Models/transactionshistorymodel.dart';
import 'package:toyshop/Models/wishitem.dart';


class AllToys{
  static List<Toy> stock = [
    Toy(
      id:'safs64dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 12.79,
      thumbnail: 'assets/images/a.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsda79fsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 65.99,
      thumbnail: 'assets/images/b.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs32f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 15.50,
      thumbnail: 'assets/images/c.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safs5464dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 120.00,
      thumbnail: 'assets/images/d.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs6898f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 37.25,
      thumbnail: 'assets/images/e.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs90787f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 17.99,
      thumbnail: 'assets/images/f.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs78456f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 9.99,
      thumbnail:  'assets/images/g.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdaf234534sf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 25.00,
      thumbnail:  'assets/images/h.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs548992f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 32.50,
      thumbnail: 'assets/images/i.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'1242342safsdafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 49.99,
      thumbnail:  'assets/images/j.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsda234156fsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 64.99,
      thumbnail: 'assets/images/k.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
  ];

  static ValueNotifier<bool> loggedin = ValueNotifier(true);
  static ValueNotifier<int> carttotal = ValueNotifier(0);
  static ValueNotifier<int> wishtotal = ValueNotifier(0);

  static List<CartItem> cartlist = [
    
  ];

  static List<WishItem> wishlist =[];

  static List<Toy> upcomings = [
    Toy(
      id:'safsdafs6898f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 50.10,
      thumbnail: 'assets/images/e.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs90787f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 50.10,
      thumbnail: 'assets/images/f.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs78456f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 50.10,
      thumbnail:  'assets/images/g.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdaf234534sf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 50.10,
      thumbnail:  'assets/images/h.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
  ];

  static List<CartItem>tracklist = [
    CartItem(
      item: Toy(
      id:'safs64dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 12.79,
      thumbnail: 'assets/images/a.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
      qty: 2)
  ];

  static List<CartItem> history = [
    CartItem(
      item: Toy(
      id:'safs64dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu \n jdls lskjflsd sjflkjs f s kijlkf sf  slkfjlskf \n sdklfjls kjslkjdf  kjkljls ljhlkjl ljkljlkj',
      price: 12.79,
      thumbnail: 'assets/images/a.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
      qty: 2)
  
  ];

              

  static List<TransactionsHistoryModel> transactionhis = [
    TransactionsHistoryModel(
      id: '3acae32d5beb17', 
      status: 'in progress', 
      datetime: 'datetime', 
      customername: 'maame esi', 
      customercontact: '124354546554874545'
    ),
    TransactionsHistoryModel(
      id: '941828d630f6a0', 
      status: 'completed', 
      datetime: 'datetime', 
      customername: 'esiedua', 
      customercontact: '124354546554874545'
    ),
    TransactionsHistoryModel(
      id: 'ce2ab1c862d16d', 
      status: 'completed', 
      datetime: 'datetime', 
      customername: 'leo messi', 
      customercontact: '124354546554874545'
    ),
    TransactionsHistoryModel(
      id: '7e60726736c512', 
      status: 'unsuccessful', 
      datetime: 'datetime', 
      customername: 'bob marley', 
      customercontact: '124354546554874545'
    ),
    TransactionsHistoryModel(
      id: '58d3ab8140e1ef', 
      status: 'completed', 
      datetime: 'datetime', 
      customername: 'kwame nkrumah', 
      customercontact: '124354546554874545'
    ),
  ];

}

