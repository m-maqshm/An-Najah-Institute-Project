import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/show_ads.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
 
  SignupScreen({super.key, this.gender});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final bool isValdite = true;
  final GlobalKey<FormState> _frmKey = GlobalKey();
  String? gender;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
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
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _frmKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: const Text(
                                "تسجيــل حســاب جديــد",
                                style: TextStyle(
                                    fontSize: 30, fontFamily: "shorog"),
                              ),
                            ),
                            TextFormScreen(
                              controller: fullnameController,
                              hint: "من فضلك ادخل اسمك الرباعي",
                              label: "الاسم الكامل",
                              keyboardType: TextInputType.text,
                              validateInput: (value) {
                                if (value!.isEmpty) {
                                  return 'يرجى ملئ هذا الحقل';
                                } else if (value.split(' ').length != 4) {
                                  return 'يرجى إدخال اسم رباعي';
                                }
                                return null;
                              },
                            ),
                            TextFormScreen(
                              controller: phoneController,
                              hint: "من فضلك ادخل رقم هاتفك هنا",
                              label: "رقم الهاتف",
                              keyboardType: TextInputType.number,
                              validateInput: (value) {
                                if (value!.isEmpty) {
                                  return 'يرجى ملئ هذا الحقل';
                                } else if (!RegExp(r'^7[1378]\d{7}$')
                                    .hasMatch(value)) {
                                  return 'ادخل رقم هاتف صحيح ';
                                }
                                return null;
                              },
                            ),
                            TextFormScreen(
                              controller: locationController,
                              hint: "من فضلك ادخل عنوانك هنا مثل: حضرموت / القطن / الريضة ",
                              label: "العنوان:",
                              keyboardType: TextInputType.visiblePassword,
                              validateInput: isValdite
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'يرجى إدخال عنوانك';
                                      } else if (!RegExp(
                                              r'^[\u0621-\u064A\s]+ \/ [\u0621-\u064A\s]+ \/ [\u0621-\u064A\s]+ \/ [\u0621-\u064A\s]+$')
                                          .hasMatch(value)) {
                                        return 'يرجى إدخال عنوان صحيح بالتنسيق: المحافظة / المديرية / المدينة / الحارة';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                            TextFormScreen(
                              controller: emailController,
                              hint: "ادخل بريدك الإلكتروني هنا مثل : ali@gmail.com",
                              label: "البريد الالكتروني:",
                              keyboardType: TextInputType.emailAddress,
                              validateInput: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'ادخل بريد الكتروني صحيح';
                                }
                                return null;
                              },
                            ),
                            TextFormScreen(
                              controller: passwordController,
                              hint: "من فضلك اكتب كلمة السر هنا ",
                              label: "كلمة المرور:",
                              keyboardType: TextInputType.visiblePassword,
                              validateInput: isValdite
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'يرجى ملئ هذا الحقل';
                                      } else if (value.length > 8) {
                                        return 'ادخل كلمة مرور لا تقل عن 8 أحرف ';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 30, bottom: 7),
                                  child: Text(
                                    "الجنـــس",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "mainFont"),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                const Text("ذكر"),
                                Radio(
                                    value: "male",
                                    groupValue: gender,
                                    onChanged: (e) {
                                      gender = e!;
                                    }),
                                const Text("انثى"),
                                Radio(
                                    value: "female",
                                    groupValue: gender,
                                    onChanged: (e) {
                                      gender = e!;
                                    })
                              ],
                            ),
                            BottonScreen(
                              text: "تسجيل",
                              method: () async {
                                if (_frmKey.currentState!.validate() == true ||
                                    !isValdite) {
                                  // عمليات التسجيل هنا
                                }
                              },
                            ),
                            SizedBox(height: height * 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
