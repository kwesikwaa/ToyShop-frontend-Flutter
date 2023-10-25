import 'package:flutter/material.dart';

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
                TextFormField(
                  controller: loginvarCtrl,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'cant be empty';
                    }
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
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    label: Text('password')
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text('Login'))
                ),
                const SizedBox(height: 10,),
                TextButton(onPressed: (){}, child: const Text('SignUp'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}