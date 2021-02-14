import 'home.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Column, FlatButton, InputDecoration, MaterialPageRoute, Navigator, RaisedButton, Scaffold, State, StatefulWidget, Text, TextField, Widget;



class Login extends StatefulWidget{
@override
_LoginState createState() =>_LoginState();
}

class _LoginState extends State<Login>{
  
   
   String _email ,_password ;
   FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration:InputDecoration(hintText:'Enter Your Email'),
              onChanged: (value){
                setState((){
                  this._email = value;
                });
              },
            ),
            


            TextField(
              decoration:InputDecoration(hintText:'Enter Your Password'),
              onChanged: (value){
                setState((){
                  this._password = value;
                });
              },
            ),

            RaisedButton(
              child: Text('Login'), 
             
          
              onPressed:() 
              async{
               try{ 
                // ignore: unused_local_variable
                UserCredential credential=
                     await instance.signInWithEmailAndPassword(email:_email,password:_password);
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => Home(),),);
               }on FirebaseAuthException catch(e){
                if (e.code =='user-not-found'){
                     //show alert
                     return 'Enter Email Address';
                  }
                else if (e.code =='wrong-password')
                
                 {
                   return 'Enter correct password';
                   //show alert
                 }

               }
             
              }
            ),

            FlatButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context) => Register(),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),

      ),
    );
  }

}

