import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: SampleHome(),
  ));
}
class SampleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm Exit!!!!"),
              content: const Text("Do u really want to exit"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("No")),
                TextButton(onPressed: () {
                  Navigator.of(context).pop(false);
                }, child: const Text("Cancel")),
              ],
            );
          });
    }


    return WillPopScope(
        onWillPop: showAlert,
        child: const Scaffold(
          body: Center(
            child: Text("Press Back Button to exit"),
          ),
        )

    );
  }
}