import 'package:an_najah_project/core/views/widget/ContenDetals.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../helpers/storage_helper.dart';
import '../../models/cors.dart';
import '../../view_models/corsvm.dart';
import '../widget/sllder.dart';
import 'login_screen.dart';

class CorseDetalsSreen extends StatelessWidget {
  Cours c;
  static StorageHelper storageHelper = StorageHelper.instance;

  Coursesvm cvm = Coursesvm();
  CorseDetalsSreen({super.key, required this.c});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.44,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/2.png'),
                                fit: BoxFit.fill),
                            // color: Color
                            color: Color(0xE8C1E7EA)),
                      ),
                      Positioned(
                          top: 180,
                          child: Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.16,
                              color: Color.fromRGBO(
                                  128, 128, 182, 0.6392156862745098),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, right: 20, bottom: 10),
                                    child: Text(
                                      '${c.courName}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      '${c.description}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  ),
                ),
                // OnBoarding(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "تفاصيل اضافية",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge /*TextStyle(fontWeight: FontWeight.bold,fontSize: 25,decoration: TextDecoration.underline)*/,
                      ),
                      ContenrDetalsapp(title: 'سعر الكورس', text: '${c.cost}'),
                      ContenrDetalsapp(
                          title: 'الفتره',
                          text: c.period == 0 ? 'الصباحية' : "المسائية"),
                      ContenrDetalsapp(
                          title: 'عدد الساعات', text: '${c.hours}'),
                      ContenrDetalsapp(
                          title: 'يتطلب امتحان ',
                          text: c.hasTest == 0
                              ? 'يتطلب امتحان'
                              : "لا يتطلب امتحان"),
                      ContenrDetalsapp(
                          title: 'عدد المقاعد', text: '${c.studetLimit}'),
                      ContenrDetalsapp(title: 'المدرب', text: '${c.teachId}'),
                      ContenrDetalsapp(
                          title: 'تاريخ البداية', text: '${c.startDate}'),
                      ContenrDetalsapp(
                          title: 'تاريخ النهاية', text: '${c.endDate}'),
                      SizedBox(
                        height: 10,
                      ),
                      BottonScreen(
                        text: 'سجل الآن',
                        method: () {
                          if (storageHelper.readKey('token') == null) {
                            Fluttertoast.showToast(
                                msg:
                                    "لايمكنك الوصول الى هذه الصفحة تأكد من تسجيل الدخول ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 4,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          } else
                            cvm
                                .regsterationCours(
                                    token: 'token',
                                    course_id: c.courId.toString())
                                ?.then(
                              (x) {
                                // if(x=='success')
                                //   return showDialog(context: context, builder: (ctx)=>AlertDialog(content: Text("تم تسجيلك في كورس ${c.courName} بنجاح"),));
                                return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Text("$x"),
                                        ));
                              },
                            );
                        },
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
