import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView1(),
  ));
}

class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 80),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 10,
        ),
        children: List.generate(
            20,
                (index) => Card(
              child: Center(
                child: Image.asset("assets/icon1.png"),
              ),
            )),
      ),
    );
  }
}