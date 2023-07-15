import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_using_sharedprefernce.dart';

class SharedHome extends StatefulWidget {

  @override
  State<SharedHome> createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  late SharedPreferences Preferences;
  late String name;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }
  // to read data from shared preference
  void fetchdata() async{
    Preferences = await SharedPreferences.getInstance();
    setState(() {
      name = Preferences.getString('namekey')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,


        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon2.png',  height: 200, width: 200, ),
              Text( "Welcome $name", style: GoogleFonts.lato(fontSize: 50,color: Colors.brown,fontStyle: FontStyle.italic,), ),


              ElevatedButton(onPressed:(){
            Preferences.setBool('newuser', true);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPageShared()));
          },  child:  Text("log Out",style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                ) ,),
            ],
          ),
        ),
      ),
    );
  }
}