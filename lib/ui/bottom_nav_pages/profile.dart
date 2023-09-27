import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
import '../login_screen.dart';
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
        TextFormField(style: ItemNameStyle,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),
             prefixIcon: Padding(padding: EdgeInsets.all(15), child:Text("Name: ",style: ItemNameStyle,))),
          controller: _nameController = TextEditingController(text: data['name'],),
        ),
        SizedBox(height: 10,),
        TextFormField(style: ItemNameStyle,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),
              prefixIcon:Padding(padding: EdgeInsets.all(15), child:Text("Phone: ",style: ItemNameStyle,))),
          controller: _phoneController = TextEditingController(text: data['phone']),
        ),
        SizedBox(height: 10,),
        TextFormField(
          style: ItemNameStyle,
           decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.purple)),
             prefixIcon:Padding(padding: EdgeInsets.all(15), child: Text("Age: ",style: ItemNameStyle,))),
             controller: _ageController = TextEditingController(text: data['age']),
        ),
        ElevatedButton(
            onPressed: ()=>updateData(), child: Text("Update",style: myButtonStyle,))
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
      body: SafeArea(child: Column(
        children: [
          Padding(
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
          ),
          ///add this


          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
              child: Text("Sign_Out",style: myButtonStyle,)),

        ],
      )),
    );
  }
}