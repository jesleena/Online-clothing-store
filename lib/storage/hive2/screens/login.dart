import 'package:flutter/material.dart';
import 'package:flutter_classwork/storage/hive2/database/hivedb.dart';
import 'package:flutter_classwork/storage/hive2/model/user_model.dart';
import 'register.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userData');
  runApp(GetMaterialApp(home: HiveLoginPage()));
}
class HiveLoginPage extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Using Hive'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(hintText: 'UserName'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: pass,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final usersList = await HiveDb.instance.getUser();
                    checkUserExist(usersList);
                  },
                  child: const Text('Login')),
              TextButton(
                  onPressed: () {
                    Get.to(HiveRegistration());
                  },
                  child: const Text('Not a User? Register Here..'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkUserExist(List<User> usersList) async {
    final lemail = email.text.trim();
    final lpass = pass.text.trim();
    bool userFound = false;

    if (lemail != '' && lpass != '') {
      await Future.forEach(usersList, (regUserFromHive) {
        if (lemail == regUserFromHive.email &&
            lpass == regUserFromHive.password) {
          userFound = true;
        } else {
          userFound = false;
        }
      });
      if (userFound == true) {
        Get.offAll(() => HiveHome(email: lemail));
        Get.snackbar("Success", "Login Success $lemail",
            colorText: Colors.green);
      } else {
        Get.snackbar("Error", "No User Found!!!!!!",
            colorText: Colors.red);
      }
    } else {
      Get.snackbar("Error", "Fields Must Not be Empty!!",
          colorText: Colors.red);
    }
  }
}