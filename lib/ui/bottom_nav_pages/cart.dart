import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/widgets/fetchProducts.dart';
import '../product_details_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
num totalPriceFinal = 0;
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  /*List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("users-cart-item").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          "price": qn.docs[i]["price"],
          "images": qn.docs[i]["images"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
     fetchProducts();
    super.initState();
  }*/
  @override
  void initState() {
    calculatingTotalPrice();
    super.initState();
  }

  calculatingTotalPrice() async {
    num totalPrice = 0;
    final firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestoreInstance
        .collection("users-cart-items")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .get();

    ///check here
    for (int i = 0; i < qn.docs.length; i++) {
      totalPrice = totalPrice + (qn.docs[i]["price"]);
      totalPriceFinal = totalPrice;
    }

    setState(() {

    });`
  }

  fetchData(String collectionName) {
    num lastElement = 0;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(collectionName)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("items")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something is wrong"),
          );
        }

        return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              lastElement = snapshot.data!.docs.length;

              return Column(
                children: [
                  Card(
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
                                  (documentSnapshot['images'][0],
                                ) ,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [Text(documentSnapshot['name'],style: ItemNameStyle,),
                                  Text(
                                      "\I\N\R ${documentSnapshot['price']}",
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
                  .collection("items").doc(documentSnapshot.id).delete().then((value) => calculatingTotalPrice());
                                  Fluttertoast.showToast(msg: "removed successfully");

                                },
                              ),
                            ],
                          )

                        ],
                      ),

                    ),
                  ),



                  if (index == lastElement - 1)

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Price :  $totalPriceFinal",
                            style:ItemPriceStyle,
                          ),
                          ElevatedButton(onPressed: (){}, child: Text("Pay Now",style:ItemNameStyle))
                        ],
                      ),
                    ),
                ],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: fetchData("users-cart-items"),
      ),
    );
  }
}

      /*Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _products.length,
            itemBuilder: (_, index) {
              return  Card(
                elevation: 5,
                child: ListTile(
                  leading:GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${_products[index]["product-img"]}"[0],
                      ) ,
                    ), onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
                  ),
                  title: Text("${_products[index]["name"]}"),
                    subtitle: Text(
                          "${_products[index]["price"].toString()}"),

              trailing: GestureDetector(
              child: CircleAvatar(
              child: Icon(Icons.delete),
              ),
              onTap: () {
              FirebaseFirestore.instance
                  .collection("users-cart-items")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items").doc(_products[index]).delete(); Fluttertoast.showToast(msg: "removed successfully");
              },
              ),
              ),
              );





            }),
      ),
    );
  }
}
*/
