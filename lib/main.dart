import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  List<BottomNavigationBarItem> routebaritems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Shop',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_checkout),
      label: 'cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          
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