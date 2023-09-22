import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
import 'package:flutter_classwork/ui/product_details_screen.dart';
Widget fetchData (String collectionName){

  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(collectionName).doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items") .snapshots(),
    builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return Card(

              elevation: 5,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height:200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
                        image: DecorationImage(
                          image:NetworkImage
                            (_documentSnapshot['images'][0],
                          ) ,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [Text(_documentSnapshot['name'],style: ItemNameStyle,),
                            Text(
                              "\I\N\R ${_documentSnapshot['price']}",
                              style:ItemPriceStyle
                            ),],
                        ),

                        GestureDetector(
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
                      ],
                    )

                  ],
                ),
              ),
            );
          });
    },
  );
}