import 'package:flutter/material.dart';
import 'package:flutter_classwork/const/AppConstants.dart';
Widget myTextField(String hintText,keyBoardType,controller){
  return TextField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
    style:  textStyle3 ,
  );
}