import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/list_titel_widget.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';

import '../../../helpers/storage_helper.dart';
import '../../view_models/profileVM.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
  ProfileScreen({super.key});
  ProfileVM profileVM=ProfileVM();
  static StorageHelper storageHelper = StorageHelper.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(backgroundColor: AppColors.appbarColor, actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white, size: 25),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationDialog(notifications: notifications);
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
          drawer: CustomDrawer(onLogin: () {

          }, onLogout: () {}),
          backgroundColor: AppColors.mainColor,
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/edtprofile');

            },
            child: Container(

              height: height * 0.06,
              width: width * 0.3,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(2, 0, 21, 0.34),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                  Text("تعديل", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: height * 0.12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child:  Text(storageHelper.readKey('email').toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(2, 0, 21, 0.34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ListTitelWidget(
                          property: "الاسم الكامل :",
                          value: storageHelper.readKey('arabicName').toString()
                        ),
                        // ListTitelWidget(
                        //   property: "الجنسية :",
                        //   value: storageHelper.readKey('email').toString(),
                        // ),
                        ListTitelWidget(
                          property: "رقم الهاتف :",
                          value: storageHelper.readKey('phoneNumber').toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white60,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(159, 154, 208, 4)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            ListTitelWidget(
                              property: "الاسم بـ EN: ",
                              value: storageHelper.readKey('englishName').toString(),
                            ),
                            ListTitelWidget(
                              property: "رقم الهوية :",
                              value: storageHelper.readKey('Id-card').toString(),
                            ),
                            ListTitelWidget(
                              property: "المحافظة :",
                              value: storageHelper.readKey('address').toString(),
                            ),
                            ListTitelWidget(
                              property: "المؤهل الدراسي :",
                              value: storageHelper.readKey('academicQualification').toString(),
                            ),
                            ListTitelWidget(
                              property: "تاريخ الميلاد : ",
                              value: storageHelper.readKey('dateOfBirth').toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
