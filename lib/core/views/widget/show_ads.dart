import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShowAds extends StatelessWidget {
  const ShowAds({super.key});

  @override
  Widget build(BuildContext context) {
 //    width = MediaQuery.of(context).size.width ;
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 1 / 4,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/alnajah.png",
        "assets/images/career.jpg" ,
        "assets/images/computer.png" ,
        "assets/images/english.jpg"
      ]
          .map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ))
          .toList(),
    );
  }
}
