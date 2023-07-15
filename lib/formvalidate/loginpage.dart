import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrationpage.dart';
import 'homepage.dart';


class LoginPage extends StatelessWidget {
  String username="jes@12345";
  String password="9876543210";
  final uname = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("login page",
          style: GoogleFonts.lato(fontSize: 20,color: Colors.brown,fontStyle: FontStyle.italic,),),
        backgroundColor: Colors.brown[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/icon1.png',  height: 100, width: 100, ),
              Text( "login", style: GoogleFonts.lato(fontSize: 50,color: Colors.brown,fontStyle: FontStyle.italic,), ),
              Text( "Welcome back,login with your credentials", style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,), ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: uname,
                  style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      hintText: "username",
                      helperText: "username should be email",
                      labelText: "username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField( style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: passwd,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      hintText: "password",
                      helperText: "password must contain 6 characters",
                      labelText: "password",
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

              ElevatedButton(onPressed:() {
                if(uname.text!="" && passwd.text!="") {
                  if (uname.text == username && passwd.text == password) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password incorrect"),backgroundColor: Colors.red,));
                  }
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password must not be empty"),backgroundColor: Colors.red,));
                }
              },

                child:  Text("login",style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                ) ,),

              TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Registrationpage()));}, child: Text( "Do you have an account? SignUp", style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,), ),)

            ],
          ),
        ),
      ),
    );
  }
}