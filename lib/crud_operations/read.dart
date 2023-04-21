import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create.dart';
class READ extends StatefulWidget {
  const READ({Key? key}) : super(key: key);

  @override
  State<READ> createState() => _READState();
}

class _READState extends State<READ> {
  dynamic data;
  //Stream<DocumentSnapshot> snapshot =  FirebaseFirestore.instance.collection("USER1").doc('UEoZ2vXP1Tqg96EaHez5').snapshots();
Future<dynamic> getData() async{
  final DocumentReference docref = FirebaseFirestore.instance.collection('USER1').doc('6ixqx091DwcGnUxEOIvq');
  await docref.get().then<dynamic>((DocumentSnapshot snapshot) {
    setState(() {
      data = snapshot.data();
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('USER1')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {

            return ListView.builder(
              itemCount: streamSnapshot.data?.docs.length,
              itemBuilder: (ctx, index) =>
                  Text( data['NAME']),
            );
          },
        ));


  }
}
