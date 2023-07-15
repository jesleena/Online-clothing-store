import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: list1_builder(),
    debugShowCheckedModeBanner: false,
  ));
}
class list1_builder extends StatelessWidget {
  @override
  var names=['Ann','Jane','Eimy','Rob','Sheza','Noah','Ann','Jane','Eimy','Rob','Sheza','Noah'];
  var images=[
    "assets/icon1.png",
    "assets/icon2.png",
    "assets/icon3.png",
    "assets/icon4.png",
    "assets/icon5.png",
    "assets/icon6.png",
    "assets/icon1.png",
    "assets/icon2.png",
    "assets/icon3.png",
    "assets/icon4.png",
    "assets/icon5.png",
    "assets/icon6.png",];

  var time=["10.30","10.00","9.30","9.00","8.55","8.45","8.00","yesterday","yesterday","yesterday","yesterday","yesterday"];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text("List Builder",)),
    body:  ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(names[index]),
                Image.asset("images[index]")
              ],
            ),
            color: Colors.amber,
          );
        }),
    floatingActionButton:
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.message)),
    );
  }
}