import 'package:flutter/material.dart';
import 'homepage.dart';


class LoginPage extends StatelessWidget {
  String username="jesleenaiqbal09@gmail.com";
  String password="9876543210";
  final uname = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      //  title: Text("login page", style: Theme.of(context).textTheme.displayLarge,)
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
             // Image.asset('assets/assignment2/icon1.png',  height: 100, width: 100, ),
              Text( "login", style: Theme.of(context).textTheme.displayMedium,) ,
              Text( "Welcome back,login with your credentials",  ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: uname,
                  style: Theme.of(context).textTheme.bodyMedium,
                   //style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      hintText: "username",
                      helperText: "username should be email",
                      labelText: "username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium,//style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
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
                        MaterialPageRoute(builder: (context) => Homee()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password incorrect"),backgroundColor: Colors.red,));
                  }
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password must not be empty"),backgroundColor: Colors.red,));
                }
              },

                child:  Text("login",
                    style: Theme.of(context).textTheme.bodySmall ),
                style: const ButtonStyle(

                ) ,),

              TextButton(onPressed: (){}, child: Text( "Do you have an account? SignUp",style: Theme.of(context).textTheme.bodyMedium

              ),)

            ],
          ),
        ),
      ),
    );
  }
}