import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/show_ads.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> frmKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 129, 128, 182),
              height: height,
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
                child: ShowAds(),
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage("assets/images/alnajah.png"),
                //       fit: BoxFit.cover),
                // ),
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
                  child: Form(
                    key: frmKey,
                    child: Column(
                      children: [
                        Container(
                          // padding: const EdgeInsets.only(bottom: 10 , top: 15),
                          margin: EdgeInsets.all(40),
                          child: const Text("تسجيــــل الدخـــول",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "shorog")),
                        ),
                        TextFormScreen(
                            controller: emailController,
                            validateInput: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'من فضلك ادخل بريدك الكتروني ';
                              }
                              return null;
                            },
                            hint:
                                "ادخل بريدك الالكتروني هنا مثل:ali.gmail.com ",
                            lable: "البريد الالكتروني:",
                            keyboardType: TextInputType.emailAddress),
                        TextFormScreen(
                            validateInput: (x) => x != null && x.isNotEmpty
                                ? null
                                : "من فضلك اكتب كلمة السر",
                            controller: passwordController,
                            hint: "من فضلك اكتب كلمة السر هنا ",
                            lable: "كلمة المرور:",
                            keyboardType: TextInputType.visiblePassword),
                        SizedBox(
                          height: height * 0.07,
                        ),
                        BottonScreen(
                          text: 'دخول',
                          methd: () {
                            if (frmKey.currentState!.validate() == true) {}
                            print('object');
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "لا تملك حساب...",
                              style: TextStyle(
                                  fontFamily: "cairo.ttf", fontSize: 15),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                             SizedBox(width:width *0.06 ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "سجل من هنا",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 8, 236),
                                    fontFamily: "cairo.ttf",
                                    fontSize: 15),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
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
    );
  }
}
