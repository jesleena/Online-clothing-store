import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firstpage.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: SplashPage(),

  ));
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState(); //create and initial state for the screen
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Firstpage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,image:AssetImage("assets/bg1.jpeg"),),),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon2.png',  height: 200, width: 200, ),
              Text( "My Application", style: GoogleFonts.lato(fontSize: 50,color: Colors.brown,fontStyle: FontStyle.italic,), ),
            ],
          ),
        ),
      ),
    );
  }
}

