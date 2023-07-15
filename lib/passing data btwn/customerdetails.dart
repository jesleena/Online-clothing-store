import 'package:flutter/material.dart';
import 'dummydata.dart';

class CustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final customer = customers.firstWhere((mapfromlist) => mapfromlist["id"] == id);

    //comparing id from previous page with id from list and store the value from that id
    //to product which is Map<String dynamic>
    return Scaffold(
        appBar: AppBar(
          title: Text("Customer Details"),
        ),
        body: Card(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    customer["image"],
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    customer["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Center(child: Text(customer["description"])),
                  Text("${customer['price']}",
                      style: const TextStyle(fontSize: 20)),
                  Text("${customer['rating']}",
                      style: const TextStyle(fontSize: 10))
                ],
              )),
        ));
  }
}