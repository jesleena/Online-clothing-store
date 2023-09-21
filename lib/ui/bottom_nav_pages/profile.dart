import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController ?_nameController;
  TextEditingController ?_phoneController;
  TextEditingController ?_ageController;


  setDataToTextField(data){
    return  Column(
      children: [

        CircleAvatar(backgroundImage: NetworkImage(data["img"]),radius: 50,),
        SizedBox(height: 30,),
        TextFormField(
          decoration: InputDecoration(  focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.purple)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),
             prefixIcon: Padding(padding: EdgeInsets.all(15), child:Text("Name: "))),
          controller: _nameController = TextEditingController(text: data['name']),
        ),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(  focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.purple)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),prefixIcon:Padding(padding: EdgeInsets.all(15), child:Text("Phone: "))),
          controller: _phoneController = TextEditingController(text: data['phone']),
        ),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(  focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.purple)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),prefixIcon:Padding(padding: EdgeInsets.all(15), child: Text("Age: "))),
          controller: _ageController = TextEditingController(text: data['age']),
        ),
        ElevatedButton(onPressed: ()=>updateData(), child: Text("Update"))
      ],
    );
  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update(
        {
          "name":_nameController!.text,
          "phone":_phoneController!.text,
          "age":_ageController!.text,
        }
    ).then((value) => Fluttertoast.showToast(msg: "updated successfully"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users-form-data").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            var data = snapshot.data;
            if(data==null){
              return Center(child: CircularProgressIndicator(),);
            }
            return setDataToTextField(data);
          },

        ),
      )),
    );
  }
}