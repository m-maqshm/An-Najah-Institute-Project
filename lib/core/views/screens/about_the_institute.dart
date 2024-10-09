import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:flutter/material.dart';
import 'package:an_najah_project/core/views/widget/appbar_widget.dart';
import 'package:an_najah_project/core/views/widget/goals_institute.dart';

class AboutTheInstitute extends StatelessWidget {
  const AboutTheInstitute({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); 

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey, 
      backgroundColor: const Color.fromARGB(255, 226, 126, 204),
            drawer: CustomDrawer(onLogin: (){}, onLogout: (){}),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarWidget(scaffoldKey: scaffoldKey), 
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 104, 109, 116),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/alnajah.png"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "معهـــد النجـــاح للتدريـــب والاستشـــارات",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  GoalsInstitute(
                    value: "الــــــرؤية : ",
                    property: "يسعـــى معهد النجاح ليكون رائداً في تقديم التدريب والإستشارات.",
                  ),
                  GoalsInstitute(
                    value: "المهمـــــــة : ",
                    property: "نهدف إلى تأهيل الأفراد والمؤسسات لتعزيز المهارات وتطوير الأداء.",
                  ),
                  GoalsInstitute(
                    value: "القيـــــم : ",
                    property: "نلتزم بالجودة الإحترافية والإبداع في جميع خدماتنا.",
                  ),
                  GoalsInstitute(
                    value: "البرامــــج : ",
                    property: "نقدم برامج تدريبية متنوعة تشمل مجالات الإدارة والتقنية والتربية.",
                  ),
                  GoalsInstitute(
                    value: "العمـــلاء :",
                    property: "نخدم الشركات، الأفراد والمؤسسات التعليمية.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}