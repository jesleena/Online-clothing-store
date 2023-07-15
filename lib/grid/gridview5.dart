import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView5(),
  ));
}

class GridView5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 60,
        //children: [],
        children: List.generate(
            10,
                (index) => const Card(
              child: Center(
                child: Icon(
                  Icons.account_balance,
                  size: 60,
                ),
              ),
            )),
      ),
    );
  }
}