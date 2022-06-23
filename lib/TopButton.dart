import 'package:flutter/material.dart';

class TopButton extends StatelessWidget{
  String lable,Qos;
  Function Action;
  TopButton({this.Action,this.lable,this.Qos=""});
  @override
  Widget build(BuildContext context) {
  return Expanded(
    flex: 1,
    child: Container(
      margin: EdgeInsets.all(2),
       child: OutlinedButton(
         onPressed: (){
           Action(this.lable+this.Qos);
         },
         child: Text(this.lable,style: TextStyle(color: Colors.white,fontSize: 16),),
         style: OutlinedButton.styleFrom(
           backgroundColor: Colors.black,
           side:BorderSide(
             color: Colors.white,
             width: 2,
           ) ,
           shape: CircleBorder(),
           padding: EdgeInsets.fromLTRB(0,20,0,20),
         ),
       ),

    ),
  );
  }
}