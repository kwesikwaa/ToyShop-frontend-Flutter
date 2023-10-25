import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/routes/cart.dart';
import 'package:toyshop/routes/shop.dart';
import 'package:toyshop/routes/profile.dart';
import 'package:toyshop/routes/wishlist.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aboduaba ToyShop',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitArea()
    );
  }
}

class InitArea extends StatefulWidget {
  const InitArea({super.key});

  @override
  State<InitArea> createState() => _InitAreaState();
}

class _InitAreaState extends State<InitArea> {
  

  int currentroute = 0;
  List routes = const[
    ShopRoute(),
    WishlistRoute(),
    CartRoute(),
    ProfileRoute()
  ];

  Widget _badges(IconData icon, String data){
    return Center(
      child: Container(
        height: 15,
        width: 15,
        child: Stack(children: [
        Icon(icon,),
        Positioned(
          child:Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Center(child:Text(data, style: const TextStyle(color: Colors.white),))
            )
          )
      ],)),
    );
  }

  


  @override
  Widget build(BuildContext context) {
    debugPrint('-=-=-=-=-=-=- rebudiling bar');
    List<BottomNavigationBarItem> routebaritems =  [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        // icon: Icon(Icons.favorite),
        // icon: Row(children: [const Icon(Icons.favorite),Text(AllToys.wishlist.length.toString())]),
        icon: _badges(Icons.favorite, AllToys.wishlist.length.toString()),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: Row(children: [const Icon(Icons.shopping_cart_checkout),Text(AllToys.cartlist.length.toString())]),
        label: 'cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(AllToys.loggedin?Icons.account_circle:Icons.no_accounts_outlined),
        label: 'Profile',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,    
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentroute,
          items: routebaritems,
          onTap: (value){
            setState(() {
              currentroute = value;
            });
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
        body: routes[currentroute],
      ),
    );
  }
}