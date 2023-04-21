import 'package:newcrudoperation/HomePage/HomePage.dart';
import 'package:flutter/material.dart';

import '../assets/Assets.dart';

class SIGNINPAGE extends StatefulWidget {
  const SIGNINPAGE({Key? key}) : super(key: key);

  @override
  State<SIGNINPAGE> createState() => _SIGNINPAGEState();
}

class _SIGNINPAGEState extends State<SIGNINPAGE> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' THIS IS SIGN IN PAGE'),
      ),

      body:  Center(
        child: Column(
          children:  [
            TextField(
              controller: username,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller:  password,
            ),
            SizedBox(height: 50,),

            InkWell(
              child: SizedBox(child: Text('SIGN IN'),),
              onTap: () async{
                try{
                 await Auth().SignInUser(username.text, password.text);
                 Navigator.of(context).push(MaterialPageRoute(builder:  (context)=>HOMEPAGE()  ));
                }
                catch(e){
                  print(' error is $e');
                }


              },

            )
          ],
        ),
      ),
    );
  }
}
