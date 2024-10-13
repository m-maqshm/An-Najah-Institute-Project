
import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/diplomas.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:an_najah_project/core/views/widget/show_ads.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DiplomasAvailable extends StatelessWidget {
    final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DiplomasAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
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
          drawer: CustomDrawer(onLogin: () {}, onLogout: () {}),
      backgroundColor: const Color.fromARGB(255, 129, 128, 182),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: MediaQuery.of(context).size.height * 1 / 4,
            color: const Color.fromARGB(255, 129, 128, 182),
            child: ShowAds()),
            Container(
              height: screenHeight * 3 / 4,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(children: [
                SizedBox(
                  height: screenHeight * .1,
                  child: Container(
                    margin: EdgeInsets.only(top:screenHeight*.0 , right: screenWidth*.05),
                    alignment:
                        Alignment.centerRight, 
                    child: Text(
                      ":الدبلومات المتاحة",
                      style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold  , decoration: TextDecoration.underline ),
                      textAlign: TextAlign.right, 
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .05,
                    ),
                    Diplomas(
                      diplom: "اللغة الإنجليزية",
                      pathImage: "assets/images/english.jpg",
                    ),
                      SizedBox(
                      width: screenWidth * .1,
                    ),
                    Diplomas(
                      diplom: "الحاسب الألي",
                      pathImage: "assets/images/computer.png",
                    ),
                  ],
                ),
                    SizedBox(
                      height: screenHeight * .03,
                    ),
                Row(
                  children: [
                    SizedBox(
                     width: screenWidth * .05,
                    ),
                    Diplomas(
                      diplom: "التأهيل المهني",
                      pathImage: "assets/images/career.jpg",
                    ),
                        SizedBox(
                      width: screenWidth * .1,
                    ),
                    Diplomas(
                      diplom: "أخرى",
                      pathImage: "assets/images/Others.png",
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
