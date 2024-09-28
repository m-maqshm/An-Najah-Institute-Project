import 'package:an_najah_project/core/views/widget/appbar_widget.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> frmKey = GlobalKey();
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
                  child: Form(
                    key: frmKey,
                    child: Column(
                      children: [
                        Container(
                          // alignment: TextAlign.right.,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const Text("تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: 50, fontFamily: "shorog")),
                        ),
                        TextFormScreen(
                            controller: emailController,
                            validateInput: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)) {
                                return 'من فضلك ادخل بريدك الكتروني ';
                              }
                              return null;
                            },
                            hint:
                                " ali@gmail.com     :ادخل بريدك الالكتروني هنا مثل",
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
                        BottonScreen(
                          text: 'دخول',
                          methd: () {
                            if (frmKey.currentState!.validate() == true) {}
                            print('object');
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "لا تملك حساب..",
                              style: TextStyle(
                                  fontFamily: "cairo.ttf", fontSize: 18),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/sinup", (Route) => false);
                              },
                              child: const Text(
                                "سجل من هنا",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 8, 236),
                                    fontFamily: "cairo.ttf",
                                    fontSize: 21),
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
