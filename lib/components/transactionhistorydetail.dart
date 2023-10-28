import 'package:flutter/material.dart';

class TransactionHistoryDetail extends StatelessWidget {
  const TransactionHistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){Navigator.pop(context);}),
      ),
      body: const Center(child: Text('yh history this')),
    );
  }
}