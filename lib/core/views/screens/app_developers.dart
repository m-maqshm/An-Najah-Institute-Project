import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/card_developer.dart';
import 'package:flutter/material.dart';

class AppDevelopers extends StatelessWidget {
  const AppDevelopers({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.2,
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: AssetImage("assets/images/building.png"))
              // ),
            ),
            Center(child: Text("مطـــــــــــوري التطبيـــــــــق")),
            SizedBox(
              height: height * 0.03,
            ),
            CardDeveloper(
              name: 'م. لقمان صالح باشريف',
              rool: 'الــــدور : Frontend Developer',
              email: 'البريد الإلكتروني : loqmanbashreef@gmail.com',
              imageUrl: 'assets/images/alnajah.png',
            ),
            Divider(),
            CardDeveloper(
              name: 'م. محمد صالح مقشم',
              rool: 'الــــدور : Backend Developer',
              email: 'البريد الإلكتروني : m-maqshm@gmail.com',
              imageUrl: 'assets/images/alnajah.png',
            ),
            Divider(),
            CardDeveloper(
              name: 'م. محمد سعيد الكثيري',
              rool: 'الـــدور : Backend Developer',
              email: 'البريد الإلكتروني : mssk407@gmail.com',
              imageUrl: 'assets/images/alnajah.png',
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 50 , top: 30),
              child: Text("يسعدنا تواصلكم عبر الإيميل التالي :    app_alnajah.com"),
            ),
            SizedBox(
              height: height * 0.1,

            )
          ]),
    );
  }
}
