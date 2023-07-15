import'package:flutter/material.dart';
import 'package:flutter_classwork/list/list_listgenerate.dart';
import 'package:flutter_classwork/list/listview_seperator.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
void main(){
  runApp(MaterialApp(home:ConvexbottomBa() ,));
}
class ConvexbottomBa extends StatefulWidget{
  @override
  State<ConvexbottomBa> createState() => _ConvexbottomBaState();
}

class _ConvexbottomBaState extends State<ConvexbottomBa> {
  int index=0;
  var screens=[
    list1_generate(),
    listView1_seperator(),
    list1_generate(),
    listView1_seperator(),
  ];

  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("ConvexbottomBar"),),


      bottomNavigationBar:  ConvexAppBar(

        items: const [
          TabItem(icon: Icon(Icons.contact_emergency)),
          TabItem(icon: Icon(Icons.search_rounded)),
          TabItem(icon: Icon(Icons.home)),
          TabItem(icon: Icon(Icons.view_agenda)),
        ],
        backgroundColor: Colors.blue,
        style: TabStyle.react,
        initialActiveIndex: 1,
       onTap: (int i){
    setState((){
    index=i;
    });
    }, ),
      body: screens[index],
    );
  } }


/*
 bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),

 */