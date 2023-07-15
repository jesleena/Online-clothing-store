import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home:
    FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,image:AssetImage("assets/bg1.jpg"),),),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon1.png',  height: 200, width: 200, ),
              Text( "My Application", style: GoogleFonts.pacifico(fontSize: 50,color: Colors.brown), ),
            ],
          ),
        ),
      ),
    );
  }
}