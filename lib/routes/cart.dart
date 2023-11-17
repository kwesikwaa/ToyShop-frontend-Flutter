// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/Transaaction/momo.dart';
import 'package:toyshop/Transaaction/momopaymentui.dart';
// import 'package:toyshop/Transaaction/payment.dart';
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
  final paystackkey = 'key';

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
      child: nothing?const Center(child: Text('no toys to b uy? add a few'),):Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12 ,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context,index){
                  
                  return Dismissible(
                    onDismissed: (DismissDirection dir){
                      setState(() {
                        cart.removeAt(index);
                        AllToys.carttotal.value = AllToys.cartlist.length;
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
                          title:Text(cart[index].item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          subtitle:Row(
                            children: [  
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    if(cart[index].qty>1){
                                      cart[index].qty -=1;
                                      gettotal();
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove_circle, color: Colors.deepPurple,)
                                ),
                              Container(
                                width: 30,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                child: Center(child: Text(cart[index].qty.toString(), style: const TextStyle(fontSize: 20),))
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                      cart[index].qty +=1;
                                      gettotal();
                                  });
                                }, 
                                child: const Icon(Icons.add_circle, color: Colors.deepPurple)
                              ),
                            ],),    
                          leading: Hero(tag:cart[index].item.thumbnail,child: CircleAvatar(radius: 25, backgroundImage: AssetImage(cart[index].item.thumbnail))),
                          trailing: Text(cart[index].item.price.toStringAsFixed(2),style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ),
                    ),
                  );
                }),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sub-Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  Text("₵ ${gettotal()}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  Text("₵ 10", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  //refactor to permanent representation of total figure
                  Text("₵ ${((double.parse(gettotal())+10.0).toStringAsFixed(2))}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.deepPurple
                  ),
                  onPressed: (){
                  final total = gettotal();
                  // may have to come back to this
                  if(AllToys.loggedin.value){
                    showDialog(context: context, builder: (builder){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        content: Text('Do you want to proceed to make payment of GHC $total for the items?'),
                        actions: [
                          ElevatedButton(onPressed: (){
                            // int x = gettotal();
                            Navigator.pop(context);
                            //flutter package approach
                            // Payment(plugin:plugin, paykey:paystackkey, amount:total).makePayment(context);
                            // for momo
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>MomoPaymentUI(amount: total)));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.deepPurple
                            ),
                            child: const Text('Proceed'),
                          ),
                          ElevatedButton(
                            onPressed: (){Navigator.pop(context);},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.deepPurple
                            ),
                            child: const Text('Cancel'),
                          )
                        ],  
                      );
                    }
                    );
                  }
                  else{
                    showDialog(context: context, builder: (builder){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        content: const Text('Please login to your account to proceed or create and account if you dont have one'),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginSignUP()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.deepPurple
                            ),
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginSignUP()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.deepPurple
                            ),
                            child: const Text('Signup'),
                          )
                        ],  
                      );
                    }
                    );
                  }
                },
                child: const Text('Pay Now'),
                ),
              )
            ],)
        ],
      ),
    );
  }
}


