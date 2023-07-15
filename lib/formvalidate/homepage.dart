import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrationpage.dart';
import 'loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,image:AssetImage("assets/bg1.png"),),),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon2.png',  height: 200, width: 200, ),
              Text( "Welcome User", style: GoogleFonts.lato(fontSize: 50,color: Colors.brown,fontStyle: FontStyle.italic,), ),
            ],
          ),
        ),
      ),
    );
  }
}