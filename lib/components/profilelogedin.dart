import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';

class ProfileLogedIn extends StatefulWidget {
  const ProfileLogedIn({super.key});

  @override
  State<ProfileLogedIn> createState() => _ProfileLogedInState();
}

class _ProfileLogedInState extends State<ProfileLogedIn> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.person_pin, size: 100,),            
            const SizedBox(height: 10,),
            const Text('Customer Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            const SizedBox(height: 5,),
            const Text('email@email.com', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
            const SizedBox(height: 5,),
            ElevatedButton.icon(
              onPressed: (){
                AllToys.loggedin = false;
                
                // just for rebuild
                setState(() {});
              }, 
              icon: const Icon(Icons.logout), 
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
              )
            ),
            const SizedBox(height: 5,),
            TabBar(
              indicator: UnderlineTabIndicator(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 5)),
              tabs: const [
                Tab(text: 'transactions',),
                Tab(text: 'something',),
                Tab(text: 'settings',),
              ]
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('transactions history'),),
                  Center(child: Text('something something'),),
                  Center(child: Text('make settings changes'),),
                ],))
          ],
        ),
        ),
    );
  }
}