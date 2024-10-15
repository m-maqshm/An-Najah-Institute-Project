import 'package:an_najah_project/core/view_models/userVM.dart';
import 'package:flutter/material.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/show_ads.dart';
import 'package:an_najah_project/core/views/widget/text_form_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> frmKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
UserVM userVM =UserVM();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

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
              child: SizedBox(
                height: 200,
                child: ShowAds(),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: frmKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text(
                            "تسجيــــل الدخـــول",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "shorog",
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormScreen(
                          controller: emailController,
                          validateInput: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                              return 'من فضلك ادخل بريدك الكتروني';
                            }
                            return null;
                          },
                          hint: "ادخل بريدك الالكتروني هنا مثل: ali@gmail.com",
                          label: "البريد الالكتروني:",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        TextFormScreen(
                          validateInput: (x) => x != null && x.isNotEmpty
                              ? null
                              : "من فضلك اكتب كلمة السر",
                          controller: passwordController,
                          hint: "من فضلك اكتب كلمة السر هنا ",
                          label: "كلمة المرور:",
                          keyboardType: TextInputType.visiblePassword,),
                        SizedBox(
                          height: height*0.05,
                        ),
                        Center(
                          child: BottonScreen(
                            text: 'دخول',
                            method: () async{
                              if (frmKey.currentState!.validate() == true) {
bool? result=  await userVM.login(email: emailController.text, password: passwordController.text);


if(result!=null && result) {
Fluttertoast.showToast(
msg: "لقد تم تسجيل دخولك في النظام بنجاح ",
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.CENTER,
timeInSecForIosWeb: 4,
backgroundColor: Colors.green,
textColor: Colors.white,
fontSize: 16.0);
Navigator.pushReplacementNamed(context, '/diplom');
}
}
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "لا تملك حساب...",
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context, "/signup", );
                              },
                              child: const Text(
                                "سجل من هنا",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 8, 236),
                                  fontSize: 15,
                                ),
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

