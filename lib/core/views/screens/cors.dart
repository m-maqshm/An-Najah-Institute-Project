import 'package:flutter/material.dart';

import '../widget/appbar_widget.dart';

class Cors_Screen extends StatelessWidget {
  const Cors_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SafeArea(
          child: Scaffold(
            appBar:  AppbarWidget(),
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/p1.jpg')),
                  ),
                ),
                Positioned(
                    top: 180,
                    child: Container(
                        padding: EdgeInsets.all(7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.14,
                        color: Color.fromARGB(63, 187, 173, 255),
                        child: Text('دبلوم الحاسب الالي ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'cairo.ttf',
                                fontWeight: FontWeight.bold,
                                fontSize: 35,),textAlign: TextAlign.right,))),
                Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(166, 166, 239, 1.0),
                      ),
                      child: Center(child: Text('regster now')),
                    )),

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
                          child: ListView.builder(
                            itemCount: 8,itemBuilder:(context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                // width: 100,
                                height: 110,
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
                                      children: [Container(padding: EdgeInsets.only(right: 10),child: Text("كورس الأوفس",style: Theme.of(context).textTheme.titleSmall)),
                                        Text('الكورس يقدم لجميع المشاركين الخلفية الشاملة عن اهم برامج شركة مايكروسوفت على  برامج شركة مايكروسوفت على  برامج شركة مايكروسوفت على  برامج شركة مايكروسوفت على الاطلاق Word ,PowerPoint and Excel.',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodySmall,),
                                      ],
                                    ),
                                  ),
                                  Container(width: 100,height: 80,decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/p1.jpg',),fit: BoxFit.fill),
                           ))
                                ],),
                              );
                            } ,),
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
