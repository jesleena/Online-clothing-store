import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'homepage.dart';

class Registrationpage extends StatefulWidget {
  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  //to validate the entire form
  final formkey = GlobalKey<FormState>();
  var confirmpass; // to store value from password field
  bool showpwd = true;
  bool showpwd2 = true;

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
              Image.asset(
                'assets/icon1.png',
                height: 100,
                width: 100,
              ),
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
                      border: OutlineInputBorder(), hintText: "UserName"),
                  validator: (email) {
                    // email - data from text form field
                    if (email!.isEmpty || !email.contains('@')) {
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
                  validator: (password) {
                    //password - data from text form field
                    // password cannot accessed outside this validator function so the value from
                    // password field assigned to  the instant variable confirmpass
                    confirmpass = password;
                    if (password!.isEmpty || password.length < 6) {
                      return "Password length should be greater than 6 / must not be empty ";
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
                  obscureText: showpwd2,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (showpwd2) {
                                showpwd2 = false;
                              } else {
                                showpwd2 = true;
                              }
                            });
                          },
                          icon: Icon(showpwd2 == true
                              ? Icons.visibility
                              : Icons.visibility_off_sharp)),
                      border: OutlineInputBorder(),
                      hintText: "ConfirmPassword"),
                  validator: (cpassword) {
                    if (cpassword != confirmpass || cpassword!.isEmpty) {
                      return "Password Mismatch/ empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    var isValid = formkey.currentState!.validate();
                    if (isValid == true) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {}
                  },
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
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Do you have an account? Login",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
