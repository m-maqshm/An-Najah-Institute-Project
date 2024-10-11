import 'package:flutter/material.dart';

class ContenrDetalsapp extends StatelessWidget {
  String? title , text;
  ContenrDetalsapp({super.key,required this.title,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(
              223, 221, 239, 0.6196078431372549)
      ),
      padding: EdgeInsets.only(top: 10,right: 15,bottom: 5),
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('$title  : ',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
          30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
          Text(text=='null'?"لم يتم التحديد بعد":'${text}',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
          30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),


        ],),);
  }
}
