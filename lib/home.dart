
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
@override
_HomeState createState() =>_HomeState();
}

class _HomeState extends State<Home>{
  FirebaseAuth instance = FirebaseAuth.instance;  //server Auth Database
  @override
  void initState(){

    super.initState();
    instance.authStateChanges().listen((User user){
      if (user == null)
      {
       // print ('no user');
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login()));
      }
      else{
        //print('there is a user');
       //Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
      }
    }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Home'),
        actions: [
          IconButton(
            icon:  Icon(Icons.logout),
            onPressed:(){
              instance.signOut();

            } ),

        ],
      ),
      body: Center(
        child: Text('Home Screen'),

      ),
    );
  }

}


