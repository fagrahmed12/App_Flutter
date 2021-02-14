import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;



class Register extends StatefulWidget{
@override
_RegisterState createState() =>_RegisterState();
}

class _RegisterState extends State<Register>{
  String _email ,_password,_name;
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Create Account'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration:InputDecoration(hintText:'Enter Your Name'),
              onChanged: (value){
                setState((){
                  this._name = value;
                });
              },
            ),
            
            
            SizedBox(height: 10,), 

            TextField(
              decoration:InputDecoration(hintText:'Enter Your Email'),
              onChanged: (value){
                setState((){
                  this._email = value;
                });
              },
            ),
            
            
            SizedBox(height: 10,), 

             TextField(
              decoration:InputDecoration(hintText:'Enter Your Password'),
              onChanged: (value){
                setState((){
                  this._password = value;
                });
              },
            ),
            
            
            SizedBox(height: 10,), 

            RaisedButton(
              child: Text('Register'), 
              onPressed:()async{
                try{
                 UserCredential credential=
                      await instance.createUserWithEmailAndPassword(email:this._email, password:this._password);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Home(),),);

                }on FirebaseAuthException catch(e)
               {
                 if(e.code=='weak-password')
                 {//show snackbar 
                    return 'Enter strong password';
                 }
                  else if(e.code=='email-already-in-use')
                 {
                    //show snackbar
                    return 'This Email already used';
                 }
                  
                }


              }
            ),
            SizedBox(height: 10,)
          ],
        ),

      ),
    );
  }

}

