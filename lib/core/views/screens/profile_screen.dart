import 'package:an_najah_project/core/views/widget/list_titel_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(145, 139, 199, 1),
      floatingActionButton: Container(
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
                child: const Text(
                  "loqmanbashreef@gmail.com",
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
                      value: "لقمان صالح ربيع باشريف",
                    ),
                    ListTitelWidget(
                      property: "الجنسية :",
                      value: "يمني",
                    ),
                    ListTitelWidget(
                      property: "رقم الهاتف :",
                      value: "772966425",
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                        property: "الاسم : ",
                        value: "لقمان صالح باشريف",
                      ),
                      ListTitelWidget(
                        property: "رقم الهوية :",
                        value: "088728389893",
                      ),
                      ListTitelWidget(
                        property: "المحافظة :",
                        value: "حضرموت",
                      ),
                      ListTitelWidget(
                        property: "المؤهل الدراسي :",
                        value: "طالب",
                      ),
                      ListTitelWidget(
                        property: "تاريخ الميلاد : ",
                        value: "1/2/2000",
                      ),
                    ],
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
