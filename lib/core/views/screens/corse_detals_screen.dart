import 'package:an_najah_project/core/views/widget/ContenDetals.dart';
import 'package:flutter/material.dart';

import '../../models/cors.dart';

// ignore: must_be_immutable
class CorseDetalsSreen extends StatelessWidget {
  Cours c;
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
                                image: AssetImage('assets/images/p1.jpg'),fit: BoxFit.fill),
                            // color: Color
                            color: Color(0x4A096975)),
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
                                  Text('${c.courName}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26),textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                                  Text('الكورس يقدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,Powدم لجميع المشاركين الخلفية الشاملة عن اهمق Word ,PowerPoint and Excel.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),)
                                ],
                              ))),
                      Positioned(
                          right: 10,
                          bottom: 5,
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  138, 169, 218, 100),
                            ),
                            child: Center(child: Text('سجل الان',style: TextStyle(color:  Colors.white,fontSize: 20),)),
                          ))
                    ],
                  ),
                ),
                // OnBoarding(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  height: 80,
                  child: ListView.builder(
                    itemCount: 13,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(130, 146, 187, 1.0),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.punch_clock,
                              size: 20,
                            ),
                            Text("${c.hours}"),
                          ],
                        ),
                        width: 90,
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(170, 166, 215, 0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("تفاصيل اضافية",style:Theme.of(context).textTheme.titleLarge /*TextStyle(fontWeight: FontWeight.bold,fontSize: 25,decoration: TextDecoration.underline)*/,),
                      ContenrDetalsapp(title: 'الاسم بـ EN', text: '${c.coursNameEn}'),
                      ContenrDetalsapp(title: 'سعر الكورس', text: '${c.cost}'),
                      ContenrDetalsapp(title: 'period', text: '${c.period}'),
                      ContenrDetalsapp(title: 'عدد الساعات', text: '${c.hours}'),
                      ContenrDetalsapp(title: 'يتطلب امتحان ', text: '${c.hasTest}'),
                      ContenrDetalsapp(title: 'عدد المقاعد', text: '${c.studetLimit}'),
                      ContenrDetalsapp(title: 'batch', text: '${c.batch}'),
                      ContenrDetalsapp(title: 'diplomId', text: '${c.diplomId}'),
                      ContenrDetalsapp(title: 'المدرب', text: '${c.teachId}'),
                      ContenrDetalsapp(title: 'تاريخ البداية', text: '${c.startDate}'),
                      ContenrDetalsapp(title: 'تاريخ النهاية', text: '${c.endDate}'),
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
