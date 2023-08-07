import 'package:flutter/material.dart';
import 'firesignup.dart';
import 'firebaseHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firehome.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FireLogin(),
  ));
}

class FireLogin extends StatefulWidget {
  const FireLogin({Key? key}) : super(key: key);

  @override
  State<FireLogin> createState() => _FireLoginState();
}

class _FireLoginState extends State<FireLogin> {
  final uname = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("login page"),
        backgroundColor: Colors.brown[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/icon1.png',  height: 100, width: 100, ),
              const Text( "login"),
              const Text( "Welcome back,login with your credentials"),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: uname,
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
                  controller: passwd,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: "password",
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

              ElevatedButton(
              onPressed: () {
    String username = uname.text.trim();
    String password =passwd.text.trim();

    FireHelper().signIn(email:username,pass:password).then((value) {
    if(value == null){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeFire()));
    }else{
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(value)));
    }
    });
    },
    child: const Text("Login Here")),

              const SizedBox(
              height: 10,
                            ),

              ElevatedButton(
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => FireSignup()));
    },
    child: const Text("Register Here")),
            ], ),),),);}}