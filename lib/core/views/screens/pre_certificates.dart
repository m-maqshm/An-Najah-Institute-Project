import 'package:an_najah_project/core/views/widget/customcard.dart';
import 'package:flutter/material.dart';

class PreCertificates extends StatelessWidget {
  const PreCertificates({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('PreCertificates'),
        ),
        body: ListView(
          children: [
            Container(
              height: height * 0.04,
              width: width * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: const Color.fromARGB(255, 149, 154, 216),
              ),
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  ": الشهـــــادات التــي تم إصــــدرها",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            CustomCard(
              title: 'دبلوم الحاسوب',
              certificatesNum: "1",
              date: "1/2/2024",
              imageUrl: "assets/images/2.png",
              state: 'نعم',
            ),
            CustomCard(
                title: "التأهيل المهني",
                imageUrl: "assets/images/1.png",
                state: "لا",
                date: "لم تصدر",
                certificatesNum: "-"),
            CustomCard(
              title: ' برمجة الجوالات',
              certificatesNum: "2",
              date: "1/5/2024",
              imageUrl: "assets/images/2.png",
              state: 'نعم',
            ),
            CustomCard(
              title: ' مهارات الإلقاء',
              certificatesNum: "3",
              date: "1/2/2024",
              imageUrl: "assets/images/2.png",
              state: 'نعم',
            ),
          ],
        ));
  }
}
