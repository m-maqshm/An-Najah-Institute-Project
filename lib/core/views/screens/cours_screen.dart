import 'package:an_najah_project/core/constants/color.dart';
import 'package:an_najah_project/core/view_models/corsvm.dart';
import 'package:an_najah_project/core/views/widget/drower.dart';
import 'package:an_najah_project/core/views/widget/notificationdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



// ignore: must_be_immutable
class CorsScreen extends StatelessWidget {
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار 3'];
   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CorsScreen({super.key});
  Coursesvm cvm = Coursesvm();
// Corsvm cvm = Corsvm();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var consumer = Consumer;
    return SafeArea(
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
             appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
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
            body: Stack(
              children: [
                // الحاوية الزرقاء تأخذ ارتفاع الشاشة بالكامل
                Container(
                  color: AppColors.mainColor,
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/2.png'),fit: BoxFit.cover
                    ),
                  ),
                ),
                Positioned(
                    top: 180,
                    child: Container(
                        padding: EdgeInsets.only(right: 10 , top: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.14,
                        color: Color.fromARGB(63, 187, 173, 255),
                        child: Text('دبلوم الحاسب الالي ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'cairo.ttf',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,),textAlign: TextAlign.right,))),
                Positioned(
                  top: 250,
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
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 20,top: 3,),
                          child: Text('الكورسات المتاحة',style: Theme.of(context).textTheme.titleLarge,textAlign:TextAlign.right,textDirection: TextDirection.rtl),),
                        Expanded(
                          child: Consumer<Coursesvm>(
                              builder: (context,c , child) {
                                return c.courses.isEmpty?Center(child: CircularProgressIndicator()):ListView.builder(
                                  itemCount: c.courses.length,
                                  itemBuilder:(context, index) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/coursDetals',arguments: c.courses[index]);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Color.fromARGB(39, 187, 173, 255)),
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(39, 187, 173, 255),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          textDirection: TextDirection.rtl,
                                          children: [

                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                textDirection: TextDirection.rtl,
                                                children: [Container(padding: EdgeInsets.only(right: 10),child: Text('${ c.courses[index].courName}',style: Theme.of(context).textTheme.titleSmall)),
                                                  Text('${ c.courses[index].description}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodySmall,),
                                                ],
                                              ),
                                            ),
                                            Container(width: 100,height: 80,decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/2.png",),fit: BoxFit.fill),
                                            ))
                                          ],),
                                      ),
                                    );
                                  } ,);
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
