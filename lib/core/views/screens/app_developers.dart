import 'package:an_najah_project/core/views/widget/card_developer.dart';
import 'package:flutter/material.dart';

class AppDevelopers extends StatelessWidget {
  const AppDevelopers({super.key});

  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 190, 71),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: height*0.3,),
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
            SizedBox(
              height: height*0.1,
            )
            
            
          ]),
    );
  }
}
