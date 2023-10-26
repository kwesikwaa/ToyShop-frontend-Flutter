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

  Widget _badges(IconData icon, int data){
    return Center(
      child: Container(
        // padding: EdgeInsets.only(bottom: 10),
        height: 45,
        width: 45,
        // color:Colors.blue,
        child: Stack(children: [
        Align(alignment:Alignment.center,child: Icon(icon,)),
        if(data>0)Align(
          alignment: Alignment.topRight,
          child:Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
            child: Center(child:Text(data.toString(), style: const TextStyle(fontSize:10, color: Colors.white),))
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
        icon: _badges(Icons.favorite, AllToys.wishlist.length),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: _badges(Icons.shopping_basket, AllToys.cartlist.length),
        label: 'cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(AllToys.loggedin?Icons.account_circle:Icons.no_accounts_outlined),
        label: 'Profile',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 74,
          child: BottomNavigationBar(
            iconSize: 40,
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
            selectedItemColor: Colors.orange[700],
            unselectedItemColor: Colors.grey,
          ),
        ),
        body: routes[currentroute],
      ),
    );
  }
}