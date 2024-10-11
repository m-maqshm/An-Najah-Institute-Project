import 'package:flutter/material.dart';

import '../../view_models/corsvm.dart';



class PreCourses extends StatelessWidget {
  PreCourses({super.key});
  Coursesvm cvm = Coursesvm();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Text(
              "الكورسات التي سبق الإشتراك فيها",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),

          Expanded(
            child:FutureBuilder(future: cvm.regesterdCourses(), builder: (context, snapshot) {

              return snapshot.connectionState == ConnectionState.waiting? Center(child: CircularProgressIndicator()):ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Courseitem(
                        courseName: "${snapshot.data![index].courName} ",
                        description:
                        "يقدم هذا الدبلوم معرفة واسعة وكبيرة حول الحاسوب وبرامجه العملاقة ويسعى لإكتساب مهارات جديدة لمتدربيه من خلال مدرب ذو خبرة عالية ",
                        imageUrl: "assets/images/2.png",
                      ),
                      SizedBox(height: 5), // فاصل بين العناصر
                    ],
                  );
                },
              );},),
          ),
        ],
      ),
    );
  }
}

















// ignore: must_be_immutable
class Courseitem extends StatelessWidget {
  Courseitem({super.key, this.courseName, this.description, this.imageUrl});
  String? courseName;
  String? description;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.2,
        width: width,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
          const Color.fromARGB(255, 211, 212, 221),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(children: [
          Container(
            height: height * 0.1,
            width: width * 0.3,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("$imageUrl")),
            ),
          ),
          Expanded(
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 10),
                  child: Text(
                    "$courseName",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "$description",
                    style: TextStyle(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3
                )
              ],
            ),
          )
        ]));
  }
}




