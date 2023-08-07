import 'package:flutter/material.dart';
import 'firebasehelper.dart';
import 'firelogin.dart';

class HomeFire extends StatelessWidget {
  const HomeFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FireHelper().signOut().then((value) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FireLogin()));
              });
            },
            child: Text("Sign_Out")),
      ),
    );
  }
}