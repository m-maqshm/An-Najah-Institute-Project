import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottonScreen extends StatelessWidget {
  String? text ;
  VoidCallback methd;

   BottonScreen({super.key , this.text,required this.methd});

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height *0.06,
        width: width *0.33,
        child: ElevatedButton(

            style: Theme.of(context).textButtonTheme.style,
            onPressed: methd ,
            child:  Center(child: Text('$text', style:TextStyle( fontFamily: "cairo.ttf" , fontSize: 18)))));
  }
}
