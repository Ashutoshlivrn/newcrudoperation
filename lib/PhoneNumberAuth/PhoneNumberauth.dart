import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:newcrudoperation/HomePage/HomePage.dart';
import 'package:newcrudoperation/assets/assets.dart';

import 'package:pinput/pinput.dart';
class PHONENUMBER extends StatefulWidget {
   PHONENUMBER({Key? key, }) : super(key: key);
 static String codeid='';
  @override
  State<PHONENUMBER> createState() => _PHONENUMBERState();
}

class _PHONENUMBERState extends State<PHONENUMBER> {
  TextEditingController PhoneNo = TextEditingController();
  // TextEditingController PdhoneNo = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THIS IS PHONE NU. AUTH PAGE'),),
      body: Center(
        child: Column(
          children: [
             Text('Write your phone number'),
             TextField(
               controller:PhoneNo ,
             ),
            SizedBox(height: 50,),

            ListTile(title: Text('send otp'),
            onTap:   ()  async{
                await firebaseAuth.verifyPhoneNumber(
                  phoneNumber: PhoneNo.text ,

                  verificationCompleted: (PhoneAuthCredential credential) async{
                    // credential = PhoneAuthProvider.credential(
                    //   verificationId: PHONENUMBER.codeid,
                    //   smsCode: VERIFYCODE.code,
                    //);
                   // await firebaseAuth.signInWithCredential(credential);
                    },

                    verificationFailed:  (FirebaseAuthException e) {
                      print( 'error is $e');
                    },
                  //1.
                    codeSent: (verificationId, forceResendingToken) async{

                         PHONENUMBER.codeid = verificationId;
                         Navigator.of(context).push(MaterialPageRoute(builder:  (context)=> VERIFYCODE() ));

                    },
                    codeAutoRetrievalTimeout:  (verificationId) {

                    }, );
            } ,

            )
          ],
        ),
      ),
    );
  }
}

class VERIFYCODE extends StatefulWidget {
  const VERIFYCODE({Key? key}) : super(key: key);


  @override
  State<VERIFYCODE> createState() => _VERIFYCODEState();
}

  class _VERIFYCODEState extends State<VERIFYCODE> {
    static String code = '';
  //string verifycode

  TextEditingController writethecode = TextEditingController();
  Icon ic = Icon(Icons.abc_sharp);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This PAge is to verify code'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 40,),
            OtpTextField(

              fieldWidth: 40 ,
              numberOfFields: 6,
              // onCodeChanged: (value) {
              //   code = value;
              //   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HOMEPAGE()  ));
              //
              // } ,
              onSubmit: (value) {
                code = value;
              },

            ),
            SizedBox(height: 40,),
            IconButton(onPressed:
                ()async{
              // Create a PhoneAuthCredential with the code
              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PHONENUMBER.codeid,
                  smsCode: code);

             try{
               await firebaseAuth.signInWithCredential(credential);
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HOMEPAGE()  ));
             }
             catch(e){
               print('kkkkkkkkkkkkkkkkk$e');
             }

            }
                , icon: Icon(Icons.abc_sharp))

  ],
  ),
  ),
  );
  }
  }

