import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';

class LoginSignUP extends StatefulWidget {
  const LoginSignUP({super.key});

  @override
  State<LoginSignUP> createState() => _LoginSignUPState();
}

class _LoginSignUPState extends State<LoginSignUP> {
  
  final _formKey = GlobalKey<FormState>();
  final loginvarCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){Navigator.pop(context);}),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.person_pin, size: 150,),
                TextFormField(
                  controller: loginvarCtrl,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'cant be empty';
                    }
                    return value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'username / email / phone',
                    label: Text('username / email / phone')
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: passwordCtrl,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'cant be empty';
                    }
                    return value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    label: Text('password')
                  ),
                ),
                const SizedBox(height: 25,),
                Align(
                  alignment:Alignment.centerLeft,
                  child:TextButton(onPressed: (){}, child: const Text('Forgotten Your Password?'))),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      AllToys.loggedin.value = true;
                      Navigator.pop(context);
                    }, 
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    child: const Text('Login'),
                      
                  )
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a custormer yet?'),
                    TextButton(onPressed: (){}, child: const Text('SignUp')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}