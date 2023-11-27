import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/customerdetailsnsettings.dart';
import 'package:toyshop/components/trackingtransaction.dart';
import 'package:toyshop/components/transactionshistory.dart';

class ProfileLogedIn extends StatefulWidget {
  const ProfileLogedIn({super.key});

  @override
  State<ProfileLogedIn> createState() => _ProfileLogedInState();
}

class _ProfileLogedInState extends State<ProfileLogedIn> {
  

  final history = AllToys.transactionhis;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
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
                AllToys.loggedin.value = false;
                
                // just for rebuild
                setState(() {});
              }, 
              icon: const Icon(Icons.logout), 
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
              )
            ),
            const SizedBox(height: 5,),
            TabBar(
              indicator: UnderlineTabIndicator(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 5)),
              tabs: const [
                Tab(child: Text('transactions', style: TextStyle(color: Colors.black87),),),
                Tab(child: Text('track', style: TextStyle(color: Colors.black87),)),
                Tab(child: Text('settings', style: TextStyle(color: Colors.black87),)),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // const Center(child: Text('No transactions history available'),),
                  TransactionsHistory(history: history,),
                  AllToys.tracklist.isEmpty?const Center(child: Text('No pending transaction to track'),):const TrackingTransaction(),
                  const CustomerDetailsNSettings()
                ],))
          ],
        ),
        ),
    );
  }
}