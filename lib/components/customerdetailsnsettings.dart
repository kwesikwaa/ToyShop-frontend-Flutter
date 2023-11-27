import 'package:flutter/material.dart';
import 'package:toyshop/components/customereditwidget.dart';

class CustomerDetailsNSettings extends StatefulWidget {
  const CustomerDetailsNSettings({super.key});

  @override
  State<CustomerDetailsNSettings> createState() => _CustomerDetailsNSettingsState();
}

class _CustomerDetailsNSettingsState extends State<CustomerDetailsNSettings> {

  // final nameCtrl = TextEditingController()

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomerEditWidget(content: "Leo Messi", onEditTap: (){}),
            CustomerEditWidget(content: "leomessi@lm8.com", onEditTap: (){}),
            CustomerEditWidget(content: "02486861313331", onEditTap: (){}),
            CustomerEditWidget(content: "'Delivery Address \ngood address to send to \n yes address \naddresssss \ndrop addressssdf sdfs '",maxlines: 5, onEditTap: (){}),
    
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  foregroundColor: Colors.white
                ),
                child: const Text('Change Password')),
            )
            
            
          ],  
        ),
      ),
    );
  }
}