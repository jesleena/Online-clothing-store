import 'package:flutter/material.dart';
class myWidget extends StatelessWidget{
  final Color? bgcolor;
  final Image? image;
  VoidCallback? onpress;
  Widget? label;

  myWidget({this.bgcolor,required this.label,
    this.image,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgcolor,
      child: ListTile(
        leading: image,
        trailing: label,
        onTap: onpress,
      ),
    );
  }
}




/*
Card(
      color: bgcolor,
      onTap: onpress,
      child: Column(
        children: [Image.asset('$image.png'),
                   Text('$label'),],


        ],
 */