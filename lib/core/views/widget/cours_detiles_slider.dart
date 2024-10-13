import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CoursDetilesSlider extends StatelessWidget {
   CoursDetilesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.1,
        autoPlay: true,
        enlargeCenterPage: true,
        // Enable pagination indicator
        pauseAutoPlayOnTouch: true,
      ),
      items: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/alnajah.png",
        "assets/images/career.jpg",
        "assets/images/computer.png",
        "assets/images/english.jpg"
      ]
          .map((item) => Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ))
          .toList(),
    );
  }
}
