import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTitelWidget extends StatelessWidget {
   ListTitelWidget({super.key , this.value , this.property});

    String? property ;
    String? value ;

  @override
  Widget build(BuildContext context) {
           double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;


    return Container(
      height: height * 0.08,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10),
                    child:  Text('$property',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Shahd"))),
              ),
              Container(
                  margin: EdgeInsets.only(left: width *.03, bottom: height*.01),
                  child: Text("$value",
                      style: TextStyle(color: Colors.white, fontSize: 15))),
            ],
          ),
          Container(width: width * 0.8, child: Divider(color: Colors.white))
        ],
      ),
    );
  }
}
