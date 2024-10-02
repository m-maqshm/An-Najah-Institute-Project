import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottonScreen extends StatelessWidget {
  String? text ;
  VoidCallback methd;

   BottonScreen({super.key , this.text,required this.methd});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 160,
        child: ElevatedButton(

            style: Theme.of(context).textButtonTheme.style,
            onPressed: methd ,
            child:  Center(child: Text('$text', style:TextStyle( fontFamily: "cairo.ttf" , fontSize: 22)))));
  }
}
