import 'package:flutter/material.dart';
import 'package:newcrudoperation/numberClass/setstateclass.dart';
import 'package:provider/provider.dart';

class MultiProV extends StatelessWidget {
  const MultiProV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            appBar: AppBar(title: Text('this is set state class'),),
            body: Container(
              height: 500,
              width: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    SizedBox(height: 30,
                    width: 30,
                    child: Container(
                      color: Colors.blue,
                    ),),

                    Text(Provider.of<ProviderA>(context,listen: true).num.toString()),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                      child: Row(
                        children: [
                          Consumer<ProviderA>(builder: (context, value, child) {
                            return IconButton(onPressed: (){
                              print('22222');
                                Provider.of<ProviderA>(context,listen: false).IncreaseNumber();

                            }, icon: Icon(Icons.format_indent_increase));
                          },

                          ),
                          SizedBox( width: 30,),
                          Consumer<ProviderA>(
                            builder: (context, value, child) {
                              return IconButton(onPressed: (){

                                print('33333');
                             Provider.of<ProviderA>(context,listen: false).DecreaseNumber();
                                // value.DecreaseNumber();
                              }, icon: Icon(Icons.format_indent_decrease));
                            },
                          ),
                          SizedBox(height: 40,),
                          IconButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetStateClass()  ));
                          }, icon: Icon(Icons.abc_rounded))
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          );

  }
}
