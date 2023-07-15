import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Expansionnn()));
}

class Expansionnn extends StatelessWidget {
  var colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.blue
  ];
  var name = ["Red", "Green", "Yellow", "Pink", "Blue"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion Tile")),
      body: Column(
        children: [
          ExpansionTile(
              title: Text("colors"),
              subtitle: Text("List of Colors"),
              children: List.generate(
                  5,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors[index],
                    ),
                    title: Text(name[index]),
                  ))),
          ExpansionTile(
              title: Text("colors"),
              subtitle: Text("List of Colors"),
              children: List.generate(
                  5, (index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors[index],
                ),
                title: Text(name[index]),
              ))),
        ],
      ),
    );
  }
}