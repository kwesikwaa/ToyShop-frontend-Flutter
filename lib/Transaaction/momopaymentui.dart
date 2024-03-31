import 'package:flutter/material.dart';
import 'package:toyshop/Transaaction/momo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MomoPaymentUI extends StatefulWidget {
  final String amount;
  // final String email;
  // final String reference;
  // final String currency;
 
  const MomoPaymentUI({
    super.key,
    required this.amount,
    // required this.email,
    // required this.reference,
    // required this.currency
  
  });

  @override
  State<MomoPaymentUI> createState() => _MomoPaymentUIState();
}

class _MomoPaymentUIState extends State<MomoPaymentUI> {

  // final future = ;

  @override
  Widget build(BuildContext context) {
    Align(alignment: AlignmentDirectional.,)
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: initializePayment(widget.amount), 
          builder: (context,snapshot){
          if(snapshot.hasData){
            final url = snapshot.data;
            return WebViewWidget(
              controller:
                WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {debugPrint("do ****************** one=======");},
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('https://kwesikwaa.com/')) {
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                )
                ..loadRequest(Uri.parse(url!))
            );
          }
          else{
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator()
                  ),
                  SizedBox(height: 10,),
                  Text('Making Payment Arrangement...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}