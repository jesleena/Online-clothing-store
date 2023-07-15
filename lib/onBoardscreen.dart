import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formvalidate/loginPage.dart';
import 'formvalidate/splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MaterialApp(
    home: OnBoardingEx(),
  ));
}
class OnBoardingEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily:'Lato',
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        imagePadding: EdgeInsets.all(20),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.brown,
              Colors.white,
              Colors.brown
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)));

    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          image: Align(
            // to place the widget at a desired position
            alignment: Alignment.topCenter,
            child: Image.asset("assets/icon3.png"),
          ),
          title: "First Page",
          body:
          "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place",
        ),
        PageViewModel(
            decoration: const PageDecoration(
              //fullScreen: true,
                titleTextStyle: TextStyle(
                    color: Colors.pinkAccent,
                     fontSize: 30,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
                imagePadding: EdgeInsets.all(20),
                boxDecoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/bg2.jpg")))),
            image: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/icon5.png"),
            ),
            title: "SecondPage",
            body:
            "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place"),
        PageViewModel(
            decoration: pageDecoration,
            image: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/icon4.png"),
            ),
            title: "Third Page",
            body: "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place")
      ],
      onDone: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
      onSkip: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashPage())),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Continue"),
      dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Colors.black,
          activeSize: Size(25, 10),
          activeColor: Colors.red,
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25),))),

    );
  }
}