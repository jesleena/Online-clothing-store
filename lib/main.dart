
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: FirstPage()
  ));
}


class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(foregroundColor: Colors.black,backgroundColor: Colors.white30,
          title:Text("Hello" ,style: TextStyle(fontStyle: FontStyle.italic
          ),),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                // Image.asset('assets/icon1.png') ,
                Image.network('https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/4_avatar-512.png'),
                // Icon(Icons.icon1.png,size: 100,color: Colors.red),
                Text("Hello",
                  style: TextStyle(color: Colors.red,fontSize: 40,fontStyle: FontStyle.italic
                  ),),

              ]
            //child:Icon(Icons.account_box,size: 100,color: Colors.pinkAccent),
          ), )
    );

  }
}
