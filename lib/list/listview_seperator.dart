
import'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home:listView1_seperator() ,));
}
class listView1_seperator extends StatelessWidget{
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

  @override
Widget build(BuildContext){
  return Scaffold(
    appBar: AppBar(title: Text("list Seperator"),),
    body: ListView.separated(
        itemBuilder: (c,index){
          return Card(child: Column(
            children: [
              Text(names[index]),
              Image.asset(images[index])
            ],
          ),);
        },

        separatorBuilder: (context,index){
          if(index % 4 ==0) {
            return Divider(
              thickness: 40,
              color: Colors.pink[200],
            );
          }
          else return Text("");
        }, itemCount: 10),
  );
}}