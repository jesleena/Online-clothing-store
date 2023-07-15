import'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home:bottomNav() ,));
}
class bottomNav extends StatefulWidget{
  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
 int index=0;

  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("bottomNavigationBar"),),


      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex){
          setState((){
            index=tapindex;
          });

        },
        currentIndex: index,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        type:BottomNavigationBarType.fixed,
        //type:BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.contact_emergency),label: "contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda),label: "View"),
        ],

      ),
    );
  } }