
import 'package:newcrudoperation/HomePage/HomePage.dart';
import 'package:newcrudoperation/SignInPage/signInPage.dart';
import 'package:newcrudoperation/assets/assets.dart';
import 'package:flutter/material.dart';

class SIGNUPPAGE extends StatefulWidget {
  const SIGNUPPAGE({Key? key}) : super(key: key);

  @override
  State<SIGNUPPAGE> createState() => _SIGNUPPAGEState();
}

class _SIGNUPPAGEState extends State<SIGNUPPAGE> {
  TextEditingController UserName = TextEditingController();
  TextEditingController UserPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' THIS IS SIGN up PAGE'),
      ),

      body:  Center(
        child: Column(
          children:  [
            TextField(
              controller: UserName,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: UserPassword,
            ),

            SizedBox(height: 40,),
            InkWell(
              child: Container( height: 30,
                width: 80,
                color: Colors.black,
                child: Text('SIGN UP ',style: TextStyle(color: Colors.white),),
              ),
              onTap: () async{
                await Auth().SignUpUser(UserName.text, UserPassword.text);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HOMEPAGE()   ));
              },
            ),
            SizedBox(height: 40,),
            InkWell(
              child: Container( height: 30,
                width: 80,
                color: Colors.black,
                child: Text('you can sign in ',style: TextStyle(color: Colors.white),),
              ),
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SIGNINPAGE()   ));
              },
            )

          ],
        ),
      ),
    );
  }
}
