import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LotiieAnim(),));
}
class LotiieAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Lottie.asset("assets/animations/penguin.json"),
        child: Lottie.network("https://lottie.host/3445b84b-dc6f-4837-b642-08bee0e935ca/D7EJR3sO75.json"),
      ),
    );
  }
}