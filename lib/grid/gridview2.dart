import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView2(),
  ));
}

class GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 20, //total no of item
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //how many items should view horizontally
              crossAxisCount: 2,
              //space between items placed vertically
              mainAxisSpacing: 20,
              //space between items placed horizontally
              crossAxisSpacing: 40),
          //provide children for gridview
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lime,
              child: Center(
                  child: Text(
                    "User $index",
                    style: const TextStyle(fontSize: 20, color: Colors.purple),
                  )),
            );
          }),
    );
  }
}