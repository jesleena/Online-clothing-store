import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: ClipWidgetEx(),
  ));
}

class ClipWidgetEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clippers"),
      ),
      body: ListView(
        children: [
          ClipRect(
            child: Align(
              widthFactor: .6,
              heightFactor: .4,
              child: Image.network(
                  'https://images.unsplash.com/photo-1595760780346-f972eb49709f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.network(
                "https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          ),

          ClipOval(
              child: Image.network(
                  "https://images.unsplash.com/photo-1689332220916-3cb59b7b6314?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")),

          ClipPath(
            clipper: ParallelogramClipper(),
            child: Container(
              height: 120,
              color: Colors.lightGreen,
              child: Center(child: Text("clipper")),
            ),
          )
          // CircleAvatar(
          //   radius: 100,
          //   backgroundImage: NetworkImage("https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          // ),
        ],
      ),
    );
  }
}