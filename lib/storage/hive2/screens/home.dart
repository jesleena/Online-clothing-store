import 'package:flutter/material.dart';

class HiveHome extends StatelessWidget {
  final String email;
  const HiveHome({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME $email"),
      ),
    );
  }
}