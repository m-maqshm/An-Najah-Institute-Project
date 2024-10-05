import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Diplomas extends StatelessWidget {
  Diplomas({super.key, this.diplom , this.pathImage});
  String? diplom;
  String? pathImage ;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: screenHeight * 0.2,
          width: screenWidth * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("$pathImage"  )),
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: screenHeight * .01,
        ),
        Container(
          height: screenHeight * .04,
          width: screenWidth * .3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: const Color.fromARGB(255, 206, 202, 231)),
          child: Center(child: Text("$diplom" , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold),)),
        )
      ],
    );
  }
}
