import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
import 'package:flutter_classwork/ui/bottom_nav_controller.dart';
import 'package:flutter_classwork/widgets/customButton.dart';
import 'package:flutter_classwork/widgets/myTextField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];
 late String? _img;
  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "img":_img,
      "name":_nameController.text,
      "phone":_phoneController.text,
      "dob":_dobController.text,
      "gender":_genderController.text,
      "age":_ageController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavController()))).catchError((error)=>print("something is wrong. $error"));
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
                  "Submit the form to continue.",
                  style:ItemNameStyle

                ),
                Text(
                  "We will not share your information with anyone.",
                  style: textStyle3
                ),
                SizedBox(
                  height: 15.h,
                ),
                myTextField("enter your name",TextInputType.text,_nameController, ),
                myTextField("enter your phone number",TextInputType.number,_phoneController),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "date of birth",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDateFromPicker(context),
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                TextField(
                  controller: _genderController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "choose your gender",
                    prefixIcon: DropdownButton<String>(
                      items: gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                          onTap: () {
                            setState(() {
                              _genderController.text = value;
                              if(value=='female')
                                {
                                   _img='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjqFo1P8UX4uvsVG5whZcOCSmz-6f16ZAEAv0P-6LSuiO-TBPNgIrS4H2DXj2Ckf9CcSk&usqp=CAU';
                                }
                              else
                                _img='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ114IM7U7Je9w0_vRUTUWfbit01htsgYJyhH1gswzS40SkZRRSX3Q6L8KsXHDQ0v_UikI&usqp=CAU';
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                myTextField("enter your age",TextInputType.number,_ageController),

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