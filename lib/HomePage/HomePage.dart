
import 'package:newcrudoperation/PhoneNumberAuth/PhoneNumberauth.dart';
import 'package:newcrudoperation/assets/assets.dart';
import 'package:newcrudoperation/SignUpPage/signUpPage.dart';
import 'package:flutter/material.dart';


class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({Key? key}) : super(key: key);

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THIS IS HOMEPAGE'),
      ),
      //Text(Auth().currentUser!.delete().toString()),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () async{
                await Auth().SignOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SIGNUPPAGE()  ));
              }
              ,
              child: Container(
                height: 40,
                width: 40,
                color: Colors.amberAccent,
              ),),
            SizedBox(height: 40,),
            Container(
              color: Colors.blue,
              child: TextButton(

                child: Text(' this is to delete the user', style: TextStyle(color: Colors.white),) ,
                onPressed: () async{
                  await Auth().DeleteTheUser();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PHONENUMBER()  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
