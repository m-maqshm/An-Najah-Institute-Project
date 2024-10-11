import 'package:an_najah_project/core/views/widget/customcard.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/cerificatvm.dart';

// ignore: must_be_immutable
class PreCertificates extends StatelessWidget {
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
  PreCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // الحصول على ارتفاع وعرض الشاشة
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 223, 134, 102),
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
          Expanded(
            child: Consumer<Cerificatvm>(
                builder: (context,c , child) {
                  return c.cerificats.isEmpty?Center(child: CircularProgressIndicator()):ListView.builder(
                    itemCount: c.cerificats.length,
                    itemBuilder:(context, index) {
                      return  CustomCard(
                        title: '${c.cerificats[index].courseName}',
                        certificatesNum: "${c.cerificats[index].certfcatNO}",
                        date: "${c.cerificats[index].dateofgenrat}",
                        imageUrl: "assets/images/2.png",
                        state: 'نعم',
                      );
                    } ,);
                }
            ),
          )
          // إضافة بطاقات الشهادات


        ],
      ),
    );
  }
}









