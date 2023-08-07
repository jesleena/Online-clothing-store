import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/storage/hive2/screens/login.dart';
import 'package:flutter_classwork/storage/hive2/model/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_classwork/storage/hive2/database/hivedb.dart';

class HiveRegistration extends StatelessWidget {
  final hemail = TextEditingController();
  final hpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Registration"),
      ),
      body: Column(
        children: [
          TextField(
            controller: hemail,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Email'),
          ),
          TextField(
            controller: hpass,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'PassWord'),
          ),
          ElevatedButton(
              onPressed: () async {
                //fetch all the registered users from hive db
                final regUserList = await HiveDb.instance.getUser();
                validateRegistratin(regUserList);
                hemail.text = "";
                hpass.text = "";
              },
              child: const Text('Register Here'))
        ],
      ),
    );
  }

  void validateRegistratin(List<User> regUserList) async {
    final eemail = hemail.text.trim();
    final epwd = hpass.text.trim();
    bool userFound = false;

    final validateEmail = EmailValidator.validate(
        eemail); // if entered email is valid then true will be returned

    if (eemail != "" && epwd != "") {
      if (validateEmail == true) {
        //iterate all the user from hive and assign it to userfromhive one by one
        await Future.forEach(regUserList, (userfromhive) {
          if (userfromhive.email == eemail) {
            //email from hive == email that we entered
            userFound = true;
          } else {
            userFound = false;
          }
        });
        if (userFound == true) {
          Get.snackbar("Error", "User already Registered / Exist",
              colorText: Colors.red);
        } else {
          final pwdvalidation = checkPassword(epwd);
          if (pwdvalidation == true) {
            final user = User(email: eemail, password: epwd);
            await HiveDb.instance.addUser(user);
            Get.to(HiveLoginPage());
            Get.snackbar("Success", "Registration Successful",
                colorText: Colors.green);
          }
        }
      } else {
        Get.snackbar("Error", 'Enter a Valid Email!!',
            colorText: Colors.red);
      }
    } else {
      Get.snackbar("Error", "Fields Must Not be Empty",
          colorText: Colors.red);
    }
  }

  bool checkPassword(String epwd) {
    if (epwd.length < 6) {
      Get.snackbar("Error", "Password length error",
          colorText: Colors.red);
      return false;
    } else {
      return true;
    }
  }
}