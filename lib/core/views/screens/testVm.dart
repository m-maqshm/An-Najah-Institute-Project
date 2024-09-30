import 'package:an_najah_project/core/data/alnjahAPI.dart';
import 'package:an_najah_project/core/model/course.dart';
import 'package:an_najah_project/core/view_model/courseVM.dart';
import 'package:an_najah_project/core/view_model/profileVM.dart';
import 'package:flutter/material.dart';

class Testvm extends StatefulWidget {


  @override
  State<Testvm> createState() => _TestvmState();
}

class _TestvmState extends State<Testvm> {

  Coursevm? coursevm;
  Course course=Course();
  @override
  void initState() {
    // TODO: implement initState

      coursevm=Coursevm();
  }
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async{
          await coursevm?.loadAllCoursesForSpecificDiploma();
         course=await coursevm?.getSpecificCourseInformation(courseName: "تطوير تطبيقات باستخدام Flutter");
         // ProfileVM profileVM=ProfileVM();

          setState(() {

          });
        }),
        body: Center(
          child: Text("${course.courseName} ${course.fees}"),
        ),
      );
    }
    catch(x){
      print(x);
    }
    return Container();
  }
}
