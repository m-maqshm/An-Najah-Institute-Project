
import 'package:an_najah_project/core/view_models/userVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/storage_helper.dart';

class CustomDrawer extends StatelessWidget {
  final Function onLogin;
  final Function onLogout;
  static StorageHelper storageHelper = StorageHelper.instance;
  CustomDrawer({required this.onLogin, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<UserVM>(
        builder: (context,u , child){
        return Drawer(
          backgroundColor: const Color.fromARGB(255, 158, 189, 214),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: height * 0.25,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: height * 0.13,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 226, 126, 204),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/user_icon.png"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(storageHelper.readKey('arabicName')==null?'الاسم':storageHelper.readKey('arabicName').toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(storageHelper.readKey('email')==null?'البريد الالكتروني':storageHelper.readKey('email').toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              storageHelper.readKey('token')==null?
        ListTile(
                leading: Text('تسجيل الدخول  '),
                title: Icon(Icons.login),
                onTap: () {Navigator.pushNamed(context, "/login");},
              ):
              ListTile(
                leading: Text('تسجيل الخروج  '),
                title: Icon(Icons.logout),
                onTap: () {
                  u.logout(token: storageHelper.readKey('token'));
                  Navigator.pushReplacementNamed(context, "/cours");

                },
              ),
              ListTile(
                leading: Text('الملف الشخصي'),
                title: Icon(Icons.person_3_outlined),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),ListTile(
                leading: Text('شهاداتي            '),
                title: Icon(Icons.star),
                onTap: () {
                  Navigator.pushNamed(context, '/preCertificates');
                },
              ),ListTile(
                leading: Text('دوراتي              '),
                title: Icon(Icons.menu_book_sharp),
                onTap: () {
                  Navigator.pushNamed(context, '/precours');
                },
              ),

              ListTile(
                leading: Text('عن المعهد        '),
                title: Icon(Icons.account_balance),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: Text('مطوري التطبيق'),
                title: Icon(Icons.group),
                onTap: () {
                  Navigator.pushNamed(context, '/devlopers');
                },
              ),
         ],
          ),
        );
      }
    );
  }
}


