import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/courseitem.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';

import '../../view_models/corsvm.dart';



// ignore: must_be_immutable
class PreCourses extends StatelessWidget {
    final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PreCourses({super.key});
  Coursesvm cvm = Coursesvm();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
           drawer: CustomDrawer(onLogin: () {}, onLogout: () {}),
      body: Column(
        children: [
        Container(
            height: height * 0.04, 
            width: width*0.7,// يمكنك تعديل هذا إذا لزم الأمر
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20 ) , bottomRight: Radius.circular(30)),
              color: const Color.fromARGB(255, 149, 154, 216),
            ),
            child: Center(
              child: Text(
                "الكورســــــات التـــي تم الإشتـــراك فيها ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.right,
              ),
            ),
          ),

          Expanded(
            child:FutureBuilder(future: cvm.regesterdCourses(), builder: (context, snapshot) {

              return snapshot.connectionState == ConnectionState.waiting? Center(child: CircularProgressIndicator()):ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Courseitem(
                        courseName: "${snapshot.data![index].courName} ",
                        description:
                        "يقدم هذا الدبلوم معرفة واسعة وكبيرة حول الحاسوب وبرامجه العملاقة ويسعى لإكتساب مهارات جديدة لمتدربيه من خلال مدرب ذو خبرة عالية ",
                        imageUrl: "assets/images/2.png",
                      ),
                      SizedBox(height: 5), // فاصل بين العناصر
                    ],
                  );
                },
              );},),
          ),
        ],
      ),
    );
  }
}



















