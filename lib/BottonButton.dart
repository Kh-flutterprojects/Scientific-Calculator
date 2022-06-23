import 'package:flutter/material.dart';

class BottonButton extends StatelessWidget{
  String lable;
  Function Action;
  BottonButton({this.Action,this.lable});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(top: 2),
        child: OutlinedButton(
          onPressed: (){
            Action(this.lable);
          },
          child: Text(this.lable,style: TextStyle(color: Colors.black,fontSize: 16),),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side:BorderSide(
              color: Colors.red,
              width: 2,
            ) ,
            shape: CircleBorder(),
            padding: EdgeInsets.fromLTRB(0,15,0,15),
          ),


      ),
    );
  }
}