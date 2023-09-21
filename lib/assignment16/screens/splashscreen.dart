import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_signup.dart';
import 'package:flutter_classwork/assignment16/provider/productprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme:  ThemeData(primarySwatch: Colors.green).copyWith(
            textTheme: TextTheme(
              displayLarge: TextStyle(fontSize: 25,fontFamily:'Amaranth', color:Colors.white,fontWeight: FontWeight.bold),
              displayMedium: TextStyle(fontSize: 25,fontFamily:'Amaranth', color:Colors.green,fontWeight: FontWeight.bold),
              displaySmall: TextStyle(fontSize: 20,fontFamily:'Amaranth', color:Colors.black),
              bodyLarge :TextStyle(fontSize: 18,fontFamily:'Amaranth',color:Colors.white ),
              bodyMedium: TextStyle(fontSize: 15,fontFamily:'Amaranth',color:Colors.black),
              bodySmall :TextStyle(fontSize: 15,fontFamily:'Amaranth',color:Colors.white ),
            )
        ),
        home: SplashPage(),
      ),
    ),
  );
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
              builder: (context) => Sign_Signup()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CircleAvatar(
            radius: 100,
          backgroundImage:NetworkImage("https://thumbs.dreamstime.com/b/salmon-beef-pork-chicken-mix-steak-meat-122176808.jpg"),),

              Text( "Eat Fresh",style: Theme.of(context).textTheme.displayMedium, ),
            ],
          ),
        ),
      ),
    );
  }
}

