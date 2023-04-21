import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SetStateClass extends StatelessWidget {
   SetStateClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('11111');
    return ChangeNotifierProvider(
        create:  (context) {
                return colProvider();
        },
    builder:(context, child) {
      return Scaffold(
        appBar: AppBar(title: Text('colours page'),),
        body:  Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              InkWell(onTap: (){
                Provider.of<colProvider>(context, listen: false).ChangeTheColour1();
              },child: Container(height: 100,width: 100, color:
                Provider.of<colProvider>(context , listen: true).
                mylist[Provider.of<colProvider>(context, listen: true).num],
              )),

              SizedBox(height: 20,),
              InkWell(onTap: (){
                Provider.of<colProvider>(context, listen: false).ChangeTheColour2();
              },child: Container(height: 100,width: 100, color:
              Provider.of<colProvider>(context, listen: true).mylist[Provider.of<colProvider>(context, listen: true).num1],
              )),

              SizedBox(height: 20,),
              InkWell(onTap: (){
                Provider.of<colProvider>(context, listen: false).ChangeTheColour3();
              },child: Container(height: 100,width: 100, color:
              Provider.of<colProvider>(context, listen: true).mylist[Provider.of<colProvider>(context, listen: true).num2],
              )),

              SizedBox(height: 20,),
              InkWell(onTap: (){
                Provider.of<colProvider>(context, listen: false).ChangeTheColour4();
              },child: Container(height: 100,width: 100, color:
              Provider.of<colProvider>(context, listen: true).mylist[Provider.of<colProvider>(context, listen: true).num3],
              )),
              SizedBox(height: 40,),
              Text(Provider.of<ProviderA>(context).num.toString()),


            ],
          ),
        )  ,
      );
    },
    );
          // return ChangeNotifierProvider(
          //     create: (context) {
          //      return ColourProvider();
          //     } ,
          //   builder: (context, child) {
          //     return Scaffold(
          //       appBar: AppBar(
          //         title: Text('colour class'),
          //       ),
          //       //Color(Colors.blue)
          //       body:
          //       InkWell(
          //         onTap: (){
          //            Provider.of<ColourProvider>(context,listen: false).ChangeColour();
          //         } ,
          //         child: SizedBox(height: 30,
          //                     width: 30,
          //                     child: Container(
          //                       color: Provider.of<ColourProvider>(context,listen: true).mylist[Provider.of<ColourProvider>(context,listen: true).index],
          //
          //                     ),),
          //       ),
          //     );
          //   },
          // );
    // return ChangeNotifierProvider(
    //   create:(context) {
    //    return ProviderA();
    //   } ,
    //   builder: (context, child) {
    //     return Scaffold(
    //       appBar: AppBar(title: Text('this is set state class'),),
    //       body: Container(
    //         height: 500,
    //         width: 300,
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //
    //
    //               SizedBox(height: 30,
    //               width: 30,
    //               child: Container(
    //                 color: Colors.blue,
    //               ),),
    //
    //
    //
    //
    //               Text(Provider.of<ProviderA>(context,listen: true).num.toString()),
    //
    //               Padding(
    //
    //                 padding: const EdgeInsets.fromLTRB(80, 0,0,0),
    //                 child: Row(
    //                   children: [
    //                     IconButton(onPressed: (){
    //                       print('22222');
    //                       Provider.of<ProviderA>(context,listen: false).IncreaseNumber();
    //
    //                     }, icon: Icon(Icons.format_indent_increase)),
    //                     SizedBox( width: 30,),
    //                     IconButton(onPressed: (){
    //                       print('33333');
    //                          Provider.of<ProviderA>(context,listen: false).DecreaseNumber();
    //                     }, icon: Icon(Icons.format_indent_decrease)),
    //                   ],
    //                 ),
    //               )
    //
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    //
    // );
  }
}
class colProvider with ChangeNotifier {

  var num = 0;
  var num1= 0;
  var num2 = 0;
  var num3 = 0;


  List mylist = [
    Colors.blueGrey,
    Colors.pink,
    Colors.green,
    Colors.amberAccent,
    Colors.brown,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.orange,
    Colors.black
  ];
  ChangeTheColour1(){
     num = 0;
     num1= Random().nextInt(9);
     num2= Random().nextInt(9);
     num3= Random().nextInt(9);
     notifyListeners();

  }
  ChangeTheColour2(){
    num1= num1;
    num = Random().nextInt(9);
    num2 =Random().nextInt(9);
    num3= Random().nextInt(9);
    notifyListeners();
  }
  ChangeTheColour3(){
    num2=num2;
    num=Random().nextInt(9);
    num1 =Random().nextInt(9);
    num3=Random().nextInt(9);
    notifyListeners();
  }
  ChangeTheColour4(){
    num3=num3;
    num=Random().nextInt(9);
    num1=Random().nextInt(9);
    num2=Random().nextInt(9);
    notifyListeners();
  }

  ChangetheColour() {
    if (num < 8) {
      num++;
    }
    else {
      num = 0;
    }
    // for( int i=0; i < mylist.length ; i++){
    //   num = mylist[i];

    notifyListeners();
  }
}
class ColourProvider with ChangeNotifier{
 // var colour = Colors.pink;
  //var colour1 = 'Colors.pink';
   int index = 0;
   List mylist = [
    Colors.blue,
    Colors.orange,
    Colors.black,
    Colors.yellow,
  ];

  ChangeColour(){
     if(index < 3){
       index++;
     }
     else{
       index = 0;
     }
    // for(int i=0; i < mylist.length; i++){
    //   mylist[i++];
    // }
    notifyListeners();
  }
}
class ProviderA with ChangeNotifier{
  var num = 4;

  IncreaseNumber(){
    num++;
    notifyListeners();
  }
  DecreaseNumber(){
    num--;
    notifyListeners();
  }

}
