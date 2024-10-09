import 'package:an_najah_project/core/views/widget/appbar_widget.dart';
import 'package:an_najah_project/core/views/widget/customcard.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PreCertificates extends StatelessWidget {
  PreCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدم مفتاح GlobalKey لإدارة الحالة
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // الحصول على ارتفاع وعرض الشاشة
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(onLogin: () {}, onLogout: () {}),
      body: Column(
        children: [
          AppbarWidget(scaffoldKey: scaffoldKey),
          Container(
            height: height * 0.04, // يمكنك تعديل هذا إذا لزم الأمر
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: const Color.fromARGB(255, 149, 154, 216),
            ),
            child: Center(
              child: Text(
                ": الشهـــــادات التــي تم إصــــدرها",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          // إضافة بطاقات الشهادات
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
            certificatesNum: "-",
          ),
          CustomCard(
            title: 'برمجة الجوالات',
            certificatesNum: "2",
            date: "1/5/2024",
            imageUrl: "assets/images/2.png",
            state: 'نعم',
          ),
          CustomCard(
            title: 'مهارات الإلقاء',
            certificatesNum: "3",
            date: "1/2/2024",
            imageUrl: "assets/images/2.png",
            state: 'نعم',
          ),
        ],
      ),
    );
  }
}
