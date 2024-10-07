
import 'package:an_najah_project/core/view_model/userVM.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  //تفعيل واغلاق التاكد من الحقول الخاصة بالفورم
  bool isValdite = true;
  UserVM userVM = UserVM();
  GlobalKey<FormState> _frmKey = GlobalKey();
  String gender = "male";

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على ارتفاع الشاشة الكاملة
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: SafeArea(
      child: Scaffold(
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
                    key: _frmKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "تسجيل حساب",
                            style:
                                TextStyle(fontSize: 50, fontFamily: "shorog"),
                          ),
                        ),
                        TextFormScreen(
                          controller: fullnameController,
                          hint: "من فضلك ادخل اسمك رباعياُ",
                          lable: "الاسم الكامل",
                          keyboardType: TextInputType.text,
                          validateInput: (value) {
                            // التحقق من الاسم الرباعي
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
                          lable: "رقم الهاتف",
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
                          hint:
                              "من فضلك ادخل عنوانك هنا مثل: حضرموت / القطن / الريضة ",
                          lable: "العنوان:",
                          keyboardType: TextInputType.visiblePassword,
                          validateInput: isValdite
                              ? (value) {
                                  // التحقق من العنوان
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
                          hint:
                              " ali@gmail.com     :ادخل بريدك الالكتروني هنا مثل",
                          lable: "البريد الالكتروني:",
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
                            lable: "كلمة المرور:",
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
                                : null),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          // textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30, bottom: 7),
                              child: Text(
                                "الجنس",
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "mainFont"),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text("ذكر"),
                            Radio(
                                value: "male",
                                groupValue: gender,
                                onChanged: (e) {
                                  gender = e!;
                                }),
                            Text("انثى"),
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
                          methd: () async {
                            if (_frmKey.currentState!.validate() == true||!isValdite) {
                              Object? result = await userVM.signup(
                                  fullName: fullnameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phoneNo: phoneController.text,
                                  address: locationController.text);
                              print(result);
                              result != null
                                  ? Fluttertoast.showToast(
                                      msg: "لقد تم تسجيلك في النظام بنجاح ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 4,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0)
                                  : Fluttertoast.showToast(
                                      msg:
                                          "هناك خطاء لم تتم عملية التسجيل في النظام اعد المحاولة لاحقاَ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 4,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
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

// background: rgba(130, 124, 186, 1);
