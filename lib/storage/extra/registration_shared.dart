import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_using_sharedprefernce.dart';



class Registrationpage extends StatefulWidget {
  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {

  late SharedPreferences Preferences;
  var name;
  var username;
  var password;
  final formkey = GlobalKey<FormState>();
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
        child: Form(
          key: formkey,
          child: Column(
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
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                  validator: (value) {
                    name = value;
                    if (value!.isEmpty) {
                      return "Enter a valid Name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "UserName"),
                  validator: (value) {
                    username = value;
                    if (value!.isEmpty || !value.contains('@')) {
                      return "Enter a valid email/ field must not be empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: GoogleFonts.lato(
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
                  validator: (value) {
                    password = value;
                    if (value!.isEmpty || value.length < 6) {
                      return "Password length should be greater than 6 / must not be empty ";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              ElevatedButton(
                  onPressed:()=>storedata(),
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
      ),
    );
  }


        void storedata() async {

        Preferences = await SharedPreferences.getInstance()!;
        Preferences.setString('namekey',name);
        Preferences.setString('unamekey',username);
        Preferences.setBool('passkey',password);

         if (username != "" && password != "") {
           var isValid = formkey.currentState!.validate();
            if (isValid == true) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPageShared()));
            }
            else {}
          }
}
}
