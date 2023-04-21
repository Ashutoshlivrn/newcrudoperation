import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newcrudoperation/PhoneNumberAuth/PhoneNumberauth.dart';
import 'package:newcrudoperation/crud_operations/create.dart';
import 'package:newcrudoperation/numberClass/multiproider.dart';
import 'package:newcrudoperation/numberClass/setstateclass.dart';
import 'package:provider/provider.dart';

import 'StreamsPage/Streamspageg.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers:
      [
        ChangeNotifierProvider<colProvider>(create: (context) {
           return colProvider();
      },  ),

        ChangeNotifierProvider<ProviderA>(create: (context) {
          return ProviderA();
        }, ),
        ChangeNotifierProvider<ColourProvider>(create: (context) {
          return ColourProvider();
        }, ),

      ],
      child: MaterialApp(
       // home: MultiProV(),
        home: CREATE(),
      ),
    );

    //   MaterialApp(
    //   //home: StartingStream(),
    //   //home: SetStateClass(),
    // // home: VERIFYCODE(),
    //
    //
    // );
  }
}


