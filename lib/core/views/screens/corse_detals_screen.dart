import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/views/widget/ContenDetals.dart';
import 'package:an_najah_project/core/views/widget/botton_screen.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';

import '../../models/cors.dart';
import '../../view_models/corsvm.dart';

// ignore: must_be_immutable
class CorseDetalsSreen extends StatelessWidget {
  Cours c;
  Coursesvm cvm = Coursesvm();
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CorseDetalsSreen({super.key, required this.c});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
            appBar: AppBar(
          backgroundColor:  AppColors.appbarColor,
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.notifications,
                        color: Colors.white, size: 25),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationDialog(
                              notifications: notifications);
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          drawer: CustomDrawer(onLogin: () {}, onLogout: () {}),
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
                        height: MediaQuery.of(context).size.height * 0.37,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/2.png'),fit: BoxFit.fill),
                            // color: Color
                            color: Color(0xE8C1E7EA)
                        ),
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
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text('${c.courName}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                                  ),
                                  Text('${c.description}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),)
                                ],
                              ))),

                    ],
                  ),
                ),
                // OnBoarding(),
                SizedBox(height: 10,),
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
                      Text("تفاصيل اضافية",style:Theme.of(context).textTheme.titleLarge /*TextStyle(fontWeight: FontWeight.bold,fontSize: 25,decoration: TextDecoration.underline)*/,),
                      ContenrDetalsapp(title: 'سعر الكورس', text: '${c.cost}'),
                      ContenrDetalsapp(title: 'period', text: '${c.period}'),
                      ContenrDetalsapp(title: 'عدد الساعات', text: '${c.hours}'),
                      ContenrDetalsapp(title: 'يتطلب امتحان ', text:c.hasTest==0? 'يتطلب امتحان':"لا يتطلب امتحان"),
                      ContenrDetalsapp(title: 'عدد المقاعد', text: '${c.studetLimit}'),
                      ContenrDetalsapp(title: 'batch', text: '${c.batch}'),
                      ContenrDetalsapp(title: 'المدرب', text: '${c.teachId}'),
                      ContenrDetalsapp(title: 'تاريخ البداية', text: '${c.startDate}'),
                      ContenrDetalsapp(title: 'تاريخ النهاية', text: '${c.endDate}'),
                      SizedBox(height: 10,),
                      BottonScreen(
                        text: 'سجل الآن',
                        method: () {
                          cvm.regsterationCours(token: 'token', course_id: c.courId.toString())?.then((x) {
                            // if(x=='success')
                            //   return showDialog(context: context, builder: (ctx)=>AlertDialog(content: Text("تم تسجيلك في كورس ${c.courName} بنجاح"),));
                            return showDialog(context: context, builder: (ctx)=>AlertDialog(content: Text("$x"),));
                          },);
                        },),
                      SizedBox(height: 25,)
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