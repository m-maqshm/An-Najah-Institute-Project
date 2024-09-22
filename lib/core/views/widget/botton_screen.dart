import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottonScreen extends StatelessWidget {
  String? text ;
   BottonScreen({super.key , this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 160,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 130, 124, 186),
                foregroundColor: Colors.white),
            onPressed: () {},
            child: const Text("login" , style: TextStyle(fontFamily: "mainFont" , fontSize: 30),)));
  }
}
