import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/loginsignup.dart';
import 'package:toyshop/components/profilelogedin.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AllToys.loggedin,
      builder: (context, loggedin, child){
        if(!loggedin){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Login to enjoy all features or continue to go through the stock as a guest user. All data in wishlist and cart will be restored when you login or create and account'
                  
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginSignUP()));
                    },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.black87,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                    child: const Text('Login')),
                )
            ],),
          );
        }
        
        else {return const ProfileLogedIn();}
      }
    );
  }
}