import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView4(),
  ));
}

class GridView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
        ///way 1
        // childrenDelegate: SliverChildListDelegate(
        // [ Card(child: Text("1")),
        //   Card(child: Text("2")), ];
        // )
        ///way 2
        // childrenDelegate: SliverChildListDelegate(List.generate(10, (index) => Card(child: Text(1)),)),
        ///way 3
        childrenDelegate:
        SliverChildBuilderDelegate(
            childCount: 20,
                (context, index) => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(child: Center(child: Text("Hello"))),
            )),),);
  }
}