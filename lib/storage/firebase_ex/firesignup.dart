import 'package:flutter/material.dart';
import 'firelogin.dart';
import 'firebaseHelper.dart';

class FireSignup extends StatefulWidget {
  const FireSignup({Key? key}) : super(key: key);

  @override
  State<FireSignup> createState() => _FireSignupState();
}

class _FireSignupState extends State<FireSignup> {
  final remail = TextEditingController();
  final rpasswd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("signup page"),
        backgroundColor: Colors.brown[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/icon1.png',  height: 100, width: 100, ),
              Text( "login"),
              Text( "Welcome back,login with your credentials"),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: remail,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: "username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: rpasswd,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: "password",
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

              ElevatedButton(onPressed:() {

      String username = remail.text.trim();
      String password = rpasswd.text.trim();

    FireHelper().signUp(email: username, pwd: password).then((message)
    {
    if (message == null)
    {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>FireLogin()));
    }

    else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        }

    });
    },
                child:  Text("Signup"),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                )),

              TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FireLogin()));}, child: Text( "Do you have an account? SignUp" ),)

            ],
          ),
        ),
      ),
    );
  }
}

