
import 'package:newcrudoperation/SignInPage/signInPage.dart';
import 'package:newcrudoperation/SignUpPage/signUpPage.dart';
import 'package:newcrudoperation/SignInPage/signInPage.dart';
import 'package:flutter/material.dart';

import '../assets/Assets.dart';

class StartingStream extends StatefulWidget {
  const StartingStream({Key? key}) : super(key: key);

  @override
  State<StartingStream> createState() => _StartingStreamState();
}

class _StartingStreamState extends State<StartingStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:  Auth().authstateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return SIGNINPAGE();
        }
        else{
          return SIGNUPPAGE();
        }
      } ,
    );
  }
}
