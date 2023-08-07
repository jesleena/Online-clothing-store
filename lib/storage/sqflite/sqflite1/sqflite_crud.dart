import 'package:flutter/material.dart';

import 'dboperation.dart';

void main() {
  runApp(MaterialApp(
    home: SqfliteCrud(),
  ));
}

class SqfliteCrud extends StatefulWidget {
  @override
  State<SqfliteCrud> createState() => _SqfliteCrudState();
}

class _SqfliteCrudState extends State<SqfliteCrud> {
  final name_controller = TextEditingController();
  final phone_controller = TextEditingController();

  var isloading = true; // intially ui is in loading state
  List<Map<String, dynamic>> contacts =
  []; // empty list for storing data from db

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    //read data from db
    final data = await SQLHelper.readData();
    setState(() {
      contacts = data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      floatingActionButton:
      //here null means create contact id is null
      FloatingActionButton(
          onPressed: () => showSheet(null), child: const Icon(Icons.add)),
      body: isloading
          ? const Center(
        child: Text("NO Data"),
      )
          : ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(contacts[index]["name"]),
                subtitle: Text(contacts[index]['phone']),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          showSheet(contacts[index]['id']);
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void showSheet(int? id) {
    if (id != null) {
      //element['id']  = id from database
      //firstWhere - first element from contacts that satisfy this condition - element['id'] == id
      final data_from_that_id = contacts.firstWhere((element) => element['id'] == id );
      name_controller.text = data_from_that_id['name'];
      phone_controller.text= data_from_that_id['phone'];
    }
    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_controller,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: phone_controller,
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await createContact();
                      }
                      if (id != null) {
                        await updateContact(id);
                      }
                      Navigator.of(context).pop();
                      name_controller.text = "";
                      phone_controller.text = "";
                    },
                    child: Text(id == null ? "Create Contact" : "Update Contact"))
              ],
            ),
          );
        });}
  Future<void> createContact() async {
    await SQLHelper.create_contact(name_controller.text, phone_controller.text);
    loadData(); // to refresh ui whenever we add a new contact
  }
  Future<void> updateContact(int? id) async{
    await SQLHelper.updateContact(id,name_controller.text,phone_controller.text);
    loadData();
  }
}