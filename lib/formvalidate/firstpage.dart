import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrationpage.dart';
import 'loginpage.dart';


class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Welcome",style: GoogleFonts.lato(fontSize: 20,color: Colors.brown,fontStyle: FontStyle.italic,),),
        backgroundColor: Colors.brown[200],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset('assets/icon1.png',  height: 200, width: 200, ),

            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>LoginPage()));},
                child:  Text("Login",
                  style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    )),
              ),),

            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Registrationpage()));},

                  child:  Text("Sign up",
                    style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                  style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}