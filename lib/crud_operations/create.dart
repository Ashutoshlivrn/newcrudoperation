import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newcrudoperation/crud_operations/read.dart';
import 'package:newcrudoperation/numberClass/setstateclass.dart';

class CREATE extends StatefulWidget {
  const CREATE({Key? key}) : super(key: key);

  @override
  State<CREATE> createState() => _CREATEState();
}

class _CREATEState extends State<CREATE> {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('USER1');
  TextEditingController aboutyourday = TextEditingController(text: 'kaisa tha');
  TextEditingController whathappened = TextEditingController();
  SizedBox sbox = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('creating document'),),
      body:   Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             sbox,
            TextField(
              controller: aboutyourday,
              decoration: InputDecoration(
                fillColor: Colors.orange,
                border: OutlineInputBorder(gapPadding: 20),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: whathappened,
              decoration: InputDecoration(
                hintText:'kya kya hua' ,
                hintMaxLines: 10,

                fillColor: Colors.blue,
                border: OutlineInputBorder(gapPadding: 20),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              await collectionReference.add({
                'NAME': 'Aman Singh',
                'DAY': 'wednesday'
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>READ()  ));
                  // collectionReference.add({
                  //   'day': 'ashutosh h',
                  //   'about': 'myday ' ,
                  // });
            }, child: Text('CREATE'
                )),

          ],
        ),
      ) ,
    );
  }
}


