import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
import 'package:flutter_classwork/widgets/customButton.dart';
import 'package:flutter_classwork/widgets/myTextField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class adminPage extends StatefulWidget {
  @override
  _adminPageState createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  TextEditingController _productnameController = TextEditingController();
  TextEditingController _productdescController = TextEditingController();
  TextEditingController _productpriceController = TextEditingController();
  TextEditingController _productimg1Controller = TextEditingController();
  TextEditingController _productimg2Controller = TextEditingController();




  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("products");
    return _collectionRef.doc(currentUser!.email).set({

      "product-name":_productnameController.text,
      "product-description":_productdescController.text,
      "product-price":_productpriceController.text,
      "product-img[0]":_productimg1Controller.text,
      "product-img[1]":_productimg2Controller.text,
    }).then((value) =>Fluttertoast.showToast(msg: "updated successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Submit .",
                  style:
                  TextStyle(fontSize: 22.sp, color: myappColor),
                ),
                Text(
                  "We will not share your information with anyone.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFFBBBBBB),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                myTextField("enter product name",TextInputType.text,_productnameController),
                myTextField("enter product description",TextInputType.text,_productdescController),
                myTextField("enter product price",TextInputType.number,_productpriceController),
                myTextField("enter product image 1",TextInputType.text,_productimg1Controller),
                myTextField("enter product image 2",TextInputType.text,_productimg2Controller),

                SizedBox(
                  height: 50.h,
                ),

                // elevated button
                customButton("Submit",()=>sendUserDataToDB()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}