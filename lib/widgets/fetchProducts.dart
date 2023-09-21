import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_classwork/ui/product_details_screen.dart';
Widget fetchData (String collectionName){

  return StreamBuilder(
    stream: FirebaseFirestore.instance .collection(collectionName).doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items") .snapshots(),
    builder:
        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return ListView.builder(
          itemCount:
          snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading:GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_documentSnapshot['images'][0],
                    ) ,
                  ),

                  onTap: (){
                   //var _product=collectionName[index];
                    //Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails( collectionName[index])));
                  }),
                title: Text(_documentSnapshot['name']),
                subtitle: Text(
                  "\$ ${_documentSnapshot['price']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                trailing: GestureDetector(
                  child: CircleAvatar(
                    child: Icon(Icons.delete),
                  ),
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items").doc(_documentSnapshot.id).delete(); Fluttertoast.showToast(msg: "removed successfully");
                  },
                ),
              ),
            );
          });
    },
  );
}