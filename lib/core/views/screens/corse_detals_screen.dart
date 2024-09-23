import 'package:an_najah_project/core/views/widgets/ContenDetals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../widgets/sllder.dart';

class CorseDetalsSreen extends StatelessWidget {
  const CorseDetalsSreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/p1.jpg')),
                            // color: Color
                            color: Color(0x4A096975)),
                      ),
                      Positioned(
                          top: 180,
                          child: Container(
                              padding: EdgeInsets.all(3),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.14,
                              color: Color.fromRGBO(
                                  128, 128, 182, 0.6392156862745098),
                              child: Text('Course Description ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)))),
                      Positioned(
                          right: 10,
                          bottom: 20,
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(166, 166, 239, 1.0),
                            ),
                            child: Center(child: Text('regster now')),
                          ))
                    ],
                  ),
                ),
                // OnBoarding(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  height: 80,
                  child: ListView.builder(
                    itemCount: 13,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(128, 128, 182, 1.0),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.punch_clock,
                              size: 20,
                            ),
                            Text("120 hours"),
                          ],
                        ),
                        width: 90,
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(199, 196, 211, 1.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moer detalse",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,decoration: TextDecoration.underline),),
                      ContenrDetalsapp(title: 'Department', text: 'Computrs'),
                      ContenrDetalsapp(title: 'Department', text: 'Computrs'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
