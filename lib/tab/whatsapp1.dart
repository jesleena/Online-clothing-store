import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: WhatsApp(),
    debugShowCheckedModeBanner: false,
  ));

  /*ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
    ),*/
}

class WhatsApp extends StatelessWidget {
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
    "assets/icon6.png",
  ];
  var time=["10.30","10.00","9.30","9.00","8.55","8.45","8.00","yesterday","yesterday","yesterday","yesterday","yesterday"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length:4,
        child:
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              //flexibleSpace: FlexibleSpaceBar( ),
              title: Text("WhatsApp",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              actions: [
                const Icon(Icons.camera_alt),
                const SizedBox(
                  width: 40,
                ),
                const Icon(Icons.search_rounded),
                const SizedBox(
                  width: 30,
                ),
                PopupMenuButton(itemBuilder: (context){
                  return[
                    const PopupMenuItem(child: Text("New group")),
                    const PopupMenuItem(child: Text("New broadcast")),
                    const PopupMenuItem(child: Text("Linked devices")),
                    const PopupMenuItem(child: Text("Starred messages")),
                    const PopupMenuItem(child: Text("Payment")),
                    const PopupMenuItem(child: Text("Settings")),
                  ];

                })
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                      child: const Icon(Icons.group)),
                  Tab(
                      child: Text(
                        'Chats',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                  Tab(
                      child: Text(
                        'Status',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                  Tab(
                      child: Text(
                        'Calls',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                ],
              ),
            ),


            TabBarView(
                children: [


                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 12,
                              (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: 80,
                            child: Row(
                              children: [
                                CircleAvatar(   backgroundImage: AssetImage(images[index])),
                                Column(
                                  children: [
                                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic)),
                                    const Icon(
                                      Icons.done_all,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))),



                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 12,
                              (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: 80,
                            child: Row(
                              children: [
                                CircleAvatar(   backgroundImage: AssetImage(images[index])),
                                Column(
                                  children: [
                                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic)),
                                    const Icon(
                                      Icons.done_all,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))),



                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 12,
                              (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: 80,
                            child: Row(
                              children: [
                                CircleAvatar(   backgroundImage: AssetImage(images[index])),
                                Column(
                                  children: [
                                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic)),
                                    const Icon(
                                      Icons.done_all,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 12,
                              (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: 80,
                            child: Row(
                              children: [
                                CircleAvatar(   backgroundImage: AssetImage(images[index])),
                                Column(
                                  children: [
                                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic)),
                                    const Icon(
                                      Icons.done_all,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )))









                ]
            ),

            FloatingActionButton(
                child: Icon(Icons.message),
                onPressed: () {}
            ),
          ]
        ),
      ),
    );
  }
}































/*
Wrap( //will break to another line on overflow
            direction: Axis.vertical, //use vertical to show  on vertical axis
            children: <Widget>[
        Container(
        margin:EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: (){ },
          child: Icon(Icons.add),
        )
    ), //button first

    Container(
    margin:EdgeInsets.all(10),
    child: FloatingActionButton(
    onPressed: (){
    //action code for button 2
    },
    backgroundColor: Colors.deepPurpleAccent,
    child: Icon(Icons.add),
    )
    ), // but
 */