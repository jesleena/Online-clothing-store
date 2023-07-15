import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // to run a program  // runApp() to attach the widget tree to the ui
  runApp(MaterialApp(
    // default theme of our app (multiplatform support)
    debugShowCheckedModeBanner: false, // to remove debug badge
    home:
    FirstPage(), // initial screen of our app , (home must be a widget  it may be stateless / statefull)
  ));
}

class FirstPage extends StatelessWidget {
  //stateless mean firstpage donot undergo any state change
  @override
  Widget build(BuildContext context) {
    // to create a widget tree  (Build context -> to Monitor the widgets in the widget tree)
    return Scaffold(

      body: Container(
        // color: Colors.blueGrey, // to set a single color to the entire screen
        decoration: const BoxDecoration(
          // image: DecorationImage(
          // image:AssetImage("assets/pic1.jpeg"),),
            gradient: LinearGradient(
              // stops: [.3,.4,.1,.1],
                colors: [
                  Colors.green,
                  Colors.lightGreen,
                  Colors.lightGreenAccent,
                  Colors.lime
                ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        child: Center(
          child: Column(
            // for column children will place from top left to bottom left
            mainAxisAlignment: MainAxisAlignment.center,
            // to move the children to center of column
            children: [
              //Icon(Icons.favorite,color: Colors.red,size: 90,),

              Image.asset('assets/icon1.png',
                height: 200,
                width: 200,
              ),
              Text(
                "My Application",

                style: GoogleFonts.pacifico(fontSize: 50,color: Colors.brown),
              ),
              // Image.asset('assets/pic1.png',
              //  height: 200,
              //   width: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}