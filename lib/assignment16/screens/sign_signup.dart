import 'package:flutter/material.dart';
import 'login.dart';


class Sign_Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Welcome",style: Theme.of(context).textTheme.displayLarge,),),



      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 100,
              backgroundImage:NetworkImage("https://thumbs.dreamstime.com/b/salmon-beef-pork-chicken-mix-steak-meat-122176808.jpg"),),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>LoginPage()));},
                child:  Text("Login", style: Theme.of(context).textTheme.bodyLarge,)  ,
                style:  ButtonStyle(
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
              child: ElevatedButton(onPressed:(){ },

                  child:  Text("Sign up", style: Theme.of(context).textTheme.bodyLarge,),
                  style:  ButtonStyle(
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