import 'package:flutter/material.dart';

class ContenrDetalsapp extends StatelessWidget {
  String? title , text;
  ContenrDetalsapp({super.key,required this.title,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: 10,left: 15,bottom: 5),
      child: Row(
        textDirection: TextDirection.rtl,
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text('$title  : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
          Text('$text',style: TextStyle(fontSize: 20),textAlign: TextAlign.right,textDirection: TextDirection.rtl)

    ],),);
  }
}
