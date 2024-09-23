import 'package:an_najah_project/core/views/widget/appbar_widget.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على ارتفاع الشاشة الكاملة
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarWidget(),
        body: Stack(
          children: [
            // الحاوية الزرقاء تأخذ ارتفاع الشاشة بالكامل
            Container(
              color: const Color.fromARGB(255, 129, 128, 182),
              height: screenHeight, // استخدام ارتفاع الشاشة الكامل
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 129, 128, 182),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Container(
                height: 200,
                width: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/alnajah.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),

            Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // اللون الأبيض للحاوية
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "login",
                          style:
                              TextStyle(fontSize: 70, fontFamily: "mainFont"),
                        ),
                      ),
                      TextFormScreen(
                          controller: emailController,
                          hint: "Enter your email eg. ali@gmail.com",
                          lable: "Email:",
                          keyboardType: TextInputType.emailAddress),
                      TextFormScreen(
                          controller: passwordController,
                          hint: "Enter your password ,please ",
                          lable: "Password:",
                          keyboardType: TextInputType.visiblePassword),
                      BottonScreen(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ..",
                            style:
                                TextStyle(fontFamily: "mainFont", fontSize: 20),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, "/sing"  ,(Route)=> false );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 95, 8, 236),
                                  fontFamily: "mainFont",
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
