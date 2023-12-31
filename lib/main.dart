import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/routes/cart.dart';
// import 'package:toyshop/routes/shop.dart';
import 'package:toyshop/routes/profile.dart';
import 'package:toyshop/routes/shop.dart';
import 'package:toyshop/routes/shopwithsliver.dart';
import 'package:toyshop/routes/wishlist.dart';

void main() {
  runApp(const MyApp());
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
    // ShopRoute(),
    ShopWithSliverRoute(),
    WishlistRoute(),
    CartRoute(),
    ProfileRoute()
  ];

  Widget _badges(IconData icon, ValueListenable listener){
    return Center(
      child: SizedBox(
        height: 45,
        width: 45,
        child: Stack(children: [
        Align(alignment:Alignment.center,child: Icon(icon,)),
        ValueListenableBuilder(valueListenable: listener, 
          builder: (builder,value,child){
           if(value>0){
            return Align(
              alignment: Alignment.topRight,
              child:Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                child: Center(child:Text(value.toString(), style: const TextStyle(fontSize:10, color: Colors.white, fontWeight: FontWeight.bold),))
                )
              );
           } return Container();
          })
        
      ],)),
    );
  }

  


  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> routebaritems =  [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: _badges(Icons.favorite, AllToys.wishtotal),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: _badges(Icons.shopping_basket, AllToys.carttotal),
        label: 'cart',
      ),
      BottomNavigationBarItem(
        icon: ValueListenableBuilder(
          valueListenable: AllToys.loggedin,
          builder: (context,loggedin,child) {
            return Icon(loggedin?Icons.account_circle:Icons.no_accounts_outlined);
          }
        ),
        label: 'Profile',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        //wrapped the bottomnavbar in a container(even sizedbox before that) 
        // in an attempt to scale down the bar, to no avail
        // it is redundate now
        bottomNavigationBar: Container(
          color: Colors.red,
          height: 79,
          child: BottomNavigationBar(
            
            iconSize: 35,
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
            selectedItemColor: Colors.grey[900],
            unselectedItemColor: Colors.grey[500],
          ),
        ),
        body: routes[currentroute],
      ),
    );
  }
}