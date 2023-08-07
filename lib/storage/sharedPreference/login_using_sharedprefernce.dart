import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sharedhome.dart';
import 'signup_using_sharedprefernce.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: LoginPageShared(),

  ));

}
class LoginPageShared extends StatefulWidget {
  @override
  State<LoginPageShared> createState() => _LoginPageSharedState();
}

class _LoginPageSharedState extends State<LoginPageShared> {

    final uname_ctrl = TextEditingController();
    final passwd_ctrl = TextEditingController();
    late SharedPreferences Preferences;


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
                  controller: uname_ctrl,
                  style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      hintText: "username",
                      labelText: "username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField( style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: passwd_ctrl,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      hintText: "password",
                      labelText: "password",
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

              ElevatedButton(
                  onPressed: () => validateandLogin(),
                child:  Text("login",style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                ) ,),

             TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationPage()));}, child: Text( "Do you have an account? SignUp", style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,), ),)

            ],
          ),
        ),
      ),
    );
  }




    void validateandLogin() async {
      Preferences = await SharedPreferences.getInstance()!;
      String storedusername = Preferences.getString('unamekey')!;
      String storedpassword = Preferences.getString('passkey')!;
      // values that we entered at text field
      String username = uname_ctrl.text;
      String password = passwd_ctrl.text;

      if (storedusername == username && storedpassword == password) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>SharedHome()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Invalid username or password",),backgroundColor: Colors.red,));
      }
    }
}
