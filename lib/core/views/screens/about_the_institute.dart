import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';
import 'package:an_najah_project/core/views/widget/goals_institute.dart';

class AboutTheInstitute extends StatelessWidget {
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
  AboutTheInstitute({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor:  AppColors.appbarColor,
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.notifications,
                        color: Colors.white, size: 25),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationDialog(
                              notifications: notifications);
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
      backgroundColor: AppColors.mainColor,
      drawer: CustomDrawer(onLogin: () {}, onLogout: () {}),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              //color: const Color.fromARGB(255, 104, 109, 116),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/alnajah.png"),
              ),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "معهـــد النجـــاح للتدريـــب والاستشارات :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: width*0.7,
                          height: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                  GoalsInstitute(
                    value: "الــــــرؤية : ",
                    property:
                    "يسعـــى معهد النجاح ليكون رائداً في تقديم التدريب والإستشارات.",
                  ),
                  GoalsInstitute(
                    value: "المهمـــــــة : ",
                    property:
                    "نهدف إلى تأهيل الأفراد والمؤسسات لتعزيز المهارات وتطوير الأداء.",
                  ),
                  GoalsInstitute(
                    value: "القيـــــم : ",
                    property:
                    "نلتزم بالجودة الإحترافية والإبداع في جميع خدماتنا.",
                  ),
                  GoalsInstitute(
                    value: "البرامــــج : ",
                    property:
                    "نقدم برامج تدريبية متنوعة تشمل مجالات الإدارة والتقنية والتربية.",
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
