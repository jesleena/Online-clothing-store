import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: FirstPage()
  ));
}


class FirstPage extends StatelessWidget {

  var images=[
    "assets/icon1.png",
    "assets/icon2.png",
    "assets/icon3.png",
    "assets/icon4.png",
    "assets/icon5.png",
    "assets/icon6.png",
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:CarouselSlider(items:List.generate(6,(index) => Card(
      child: Image.asset(images[index]),
    )), options:  CarouselOptions(
            height: 800,
            aspectRatio: 16 / 9,
            viewportFraction: .8,
            initialPage: 2,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayCurve: Curves.easeInOutCubicEmphasized,
            enlargeCenterPage: false,
            enlargeFactor: .3,
            scrollDirection: Axis.horizontal
        ),
        )
    );

  }
}
