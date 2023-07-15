import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sharedhome.dart';
import 'login_using_sharedprefernce.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  late SharedPreferences Preferences;
  bool showpwd = true;

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Registration page",
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.brown,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.brown[300],
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon1.png', height: 100, width: 100,),
            Text(
              "Sign Up",
              style: GoogleFonts.lato(
                fontSize: 50,
                color: Colors.brown,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "create an account, its free",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name"),
                controller: name_ctrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "UserName"),
                controller: uname_ctrl,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_ctrl,style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
                obscureText: showpwd,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpwd) {
                              showpwd = false;
                            } else {
                              showpwd = true;
                            }
                          });
                        },
                        icon: Icon(showpwd == true
                            ? Icons.visibility
                            : Icons.visibility_off_sharp)),
                    border: OutlineInputBorder(),
                    hintText: "Password"),
                textInputAction: TextInputAction.next,
              ),
            ),
            ElevatedButton(
                onPressed: () => storedata(),
                 child: Text(
              "Sign up",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white60,
                fontStyle: FontStyle.italic,
              ),
            ),
          style: const ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(Colors.brown),
          )),
          ],
        ),
      ),
    );
  }
  void storedata() async {
    String personname = name_ctrl.text;
    String username = uname_ctrl.text;
    String password = password_ctrl.text;

    Preferences = await SharedPreferences.getInstance()!;
    Preferences.setString('namekey', personname);
    Preferences.setString('unamekey', username);
    Preferences.setString('passkey', password);

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPageShared()));
  }
}