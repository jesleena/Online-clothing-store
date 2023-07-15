import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  void main() {
    runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: list1_generate(),
      debugShowCheckedModeBanner: false,
    ));
  }
class list1_generate extends StatelessWidget {
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
    appBar: AppBar( title: Text("List generate",)),

    body:  ListView(
children:List.generate(12,(index) => Card(child:
ListTile(
  leading:  CircleAvatar(
      backgroundImage: AssetImage(images[index])),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
      const Icon(
        Icons.done_all,
        color: Colors.blueAccent,
      ),
    ],
  ),
  trailing: Column(crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text(time[index]),
      Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.green),
      ),
    ],
  ),
),)


)),);

  }
}
