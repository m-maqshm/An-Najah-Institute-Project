
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function onLogin;
  final Function onLogout;

  CustomDrawer({required this.onLogin, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                          image: AssetImage("assets/images/alnajah.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "لقمان باشريف ",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "loqmanbashreef@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Text('تسجيل الدخول  '),
            title: Icon(Icons.login),
            onTap: () {Navigator.pushNamed(context, "/login");},
          ),
          ListTile(
            leading: Text('تسجيل الخروج  '),
            title: Icon(Icons.logout),
            onTap: () {},
          ),
          ListTile(
            leading: Text('الملف الشخصي'),
            title: Icon(Icons.person_3_outlined),
            onTap: () {},
          ),
          SizedBox(
            height: height*0.3,
          ),
          ListTile(
            leading: Text('عن المعهد        '),
            title: Icon(Icons.account_balance),
            onTap: () {},
          ),
          ListTile(
            leading: Text('مطوري التطبيق'),
            title: Icon(Icons.group),
            onTap: () {},
          ),





        ],
      ),
    );
  }
}


