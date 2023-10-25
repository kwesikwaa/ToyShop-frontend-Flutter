import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Transaaction/momo.dart';
import 'package:toyshop/Transaaction/momopaymentui.dart';
import 'package:toyshop/Transaaction/payment.dart';
import 'package:toyshop/components/loginsignup.dart';
import 'package:toyshop/components/toydetail.dart';

class CartRoute extends StatefulWidget {
  const CartRoute({super.key});

  @override
  State<CartRoute> createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {
  
  final cart = AllToys.cartlist;

  final plugin = PaystackPlugin();
  final paystackkey = 'pk_test_0e0a3ee77f7c00b35972173c6c8a7a57ea83d531';

  gettotal(){
    double total = 0; 
    for(CartItem c in cart){
      total += c.qty * c.item.price;
    }
    return total.toStringAsFixed(2);
  }

  

  @override
  void initState() {
    plugin.initialize(publicKey: paystackkey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool nothing = AllToys.cartlist.isEmpty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: nothing?const Center(child: Text('No Toys To Buy? Add a few'),):Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context,index){
                
                return Dismissible(
                  onDismissed: (DismissDirection dir){
                    setState(() {
                      cart.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Align(alignment: Alignment.centerLeft, child: Icon(Icons.delete)),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: const Align(alignment: Alignment.centerRight, child: Icon(Icons.delete)),
                  ),
                  key: UniqueKey(),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: cart[index].item)));
                    },
                    child: Card(
                      child: ListTile(
                        title:Text(cart[index].item.name),
                        subtitle: Text(cart[index].item.price.toStringAsFixed(2)),
                        leading: Hero(tag:cart[index].item.thumbnail,child: CircleAvatar(radius: 25, backgroundImage: AssetImage(cart[index].item.thumbnail))),
                        trailing: FractionallySizedBox(
                          widthFactor: 0.3,
                          child: Row(children: [
                            IconButton(onPressed: (){
                              setState(() {
                                if(cart[index].qty>1){
                                  cart[index].qty -=1;
                                  gettotal();
                                }
                              });
                            }, icon: const Icon(Icons.remove_circle)),
                            Text(cart[index].qty.toString()),
                            IconButton(onPressed: (){
                              setState(() {
                                  cart[index].qty +=1;
                                  gettotal();
                              });
                            }, icon: const Icon(Icons.add_circle)),
                          ],),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("GHC ${gettotal()}", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ElevatedButton(child: const Text('Check Out'),onPressed: (){
                final total = gettotal();
                if(AllToys.loggedin){
                  showDialog(context: context, builder: (builder){
                    return AlertDialog(
                      content: Text('Do you want to proceed to make payment of GHC $total for the items?'),
                      actions: [
                        ElevatedButton(child: const Text('Proceed'),onPressed: (){
                          // int x = gettotal();
                          Navigator.pop(context);
                          //flutter package approach
                          // Payment(plugin:plugin, paykey:paystackkey, amount:total).makePayment(context);
                          // for momo
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MomoPaymentUI(amount: total)));
                        },),
                        ElevatedButton(child: const Text('Cancel'),onPressed: (){Navigator.pop(context);},)
                      ],  
                    );
                  }
                  );
                }
                else{
                  showDialog(context: context, builder: (builder){
                    return AlertDialog(
                      content: Text('Please login to your account to proceed or create and account if you dont have one'),
                      actions: [
                        ElevatedButton(child: const Text('Login'),onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginSignUP()));
                        },),
                        ElevatedButton(child: const Text('Signup'),onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginSignUP()));
                        },)
                      ],  
                    );
                  }
                  );
                }
              },)
            ],)
        ],
      ),
    );
  }
}