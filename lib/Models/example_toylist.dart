import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/toymodel.dart';


class AllToys{
  static List<Toy> stock = [
    Toy(
      id:'safs64dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 12.79,
      thumbnail: 'assets/images/a.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsda79fsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 65.99,
      thumbnail: 'assets/images/b.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs32f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 15.50,
      thumbnail: 'assets/images/c.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safs5464dafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 120.00,
      thumbnail: 'assets/images/d.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs6898f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 37.25,
      thumbnail: 'assets/images/e.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs90787f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 17.99,
      thumbnail: 'assets/images/f.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs78456f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 9.99,
      thumbnail:  'assets/images/g.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdaf234534sf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 25.00,
      thumbnail:  'assets/images/h.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsdafs548992f',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 32.50,
      thumbnail: 'assets/images/i.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'1242342safsdafsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 49.99,
      thumbnail:  'assets/images/j.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
    Toy(
      id:'safsda234156fsf',
      name: 'Elefant',
      description: 'Elefant is a friendly elephant in fugu',
      price: 64.99,
      thumbnail: 'assets/images/k.png',
      available: true,
      images: ['lslos','ryrty','dfsdfs']
    ),
  ];

  static bool loggedin = false;

  static List<CartItem> cartlist = [
    
  ];

  static List<Toy> wishlist =[];

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

}

