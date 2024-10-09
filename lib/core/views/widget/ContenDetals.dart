import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
      Text('$title  : ',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
          30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
          Text('$text',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
          30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),


    ],),);
  }
}
