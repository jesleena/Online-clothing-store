import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// to perform event of gestures we use Gesture detector/ inkwell
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomSheett(),));
}

class BottomSheett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        GestureDetector(
            onLongPress: (){
              showSheet(context);
            },
            child: Image.asset("assets/icon2.png")),
      ),
    );
  }
  void showSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        child:  const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              //   leading: Icon(Icons.share),
              leading:FaIcon(FontAwesomeIcons.facebook,color: Colors.blue),
              title:Text('Share'),

            ),
            ListTile(
              //leading: Icon(Icons.copy),
              leading: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),
              title:Text('Copy'),
            )
          ],
        ),
      );
    });
  }
}