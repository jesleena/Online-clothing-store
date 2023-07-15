import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView3(),
  ));
}

class GridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        children: List.generate(
            15,
                (index) => Container(
                decoration:BoxDecoration(
                  color: Colors.black,),
                child: Column(
                  children: [
                    Image.asset("assets/icon1.png",height: 80,),
                    const Text(
                      "hi",
                      style: TextStyle(color: Colors.yellow),)
                  ],
                ))),
      ),
    );
  }
}