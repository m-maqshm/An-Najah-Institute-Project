import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GoalsInstitute extends StatelessWidget {
  String? value ;
  String? property ;
  GoalsInstitute({super.key , this.value  , this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
            margin: EdgeInsets.only(right: 20 , top: 15 , bottom: 10),
            child: Text("$value" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),)),
        Container(
            margin: EdgeInsets.only(right: 20 ),
            child: Text("$property" , style: TextStyle(fontSize: 14),))
      ],
    );
  }
}