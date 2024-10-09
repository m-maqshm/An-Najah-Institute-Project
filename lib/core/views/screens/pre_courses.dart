import 'package:an_najah_project/core/views/widget/courseitem.dart';
import 'package:flutter/material.dart';

class PreCourses extends StatelessWidget {
  const PreCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Text(
              "الكورسات التي سبق الإشتراك فيها",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    Courseitem(
                      courseName: "دبلوم الحاسوب المتقدم",
                      description:
                          "يقدم هذا الدبلوم معرفة واسعة وكبيرة حول الحاسوب وبرامجه العملاقة ويسعى لإكتساب مهارات جديدة لمتدربيه من خلال مدرب ذو خبرة عالية ",
                      imageUrl: "assets/images/2.png",
                    ),
                    SizedBox(height: 5), // فاصل بين العناصر
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
