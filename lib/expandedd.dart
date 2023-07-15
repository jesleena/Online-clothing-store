import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expandedd(),
  ));
}

class Expandedd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/icon4.png")),
              Text("Name:",),
              Expanded(child: Image.asset("assets/icon5.png")),
              Text("Name:",),
            ],
          ),
        ),
    );}}