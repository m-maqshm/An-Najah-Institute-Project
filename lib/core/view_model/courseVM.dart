 import 'package:an_najah_project/core/data/alnjahAPI.dart';
import 'package:an_najah_project/core/model/course.dart';

class Coursevm {
  List <Course> allcourses=[],computerCourses=[],englishCourses=[];

loadAllCoursesInThisDibloma(int id)
{
  switch(id){
    case 1://المعرف الخاص بدبلوم الحاسوب
      computerCourses=Alnjahapi.coputerCorsess["courses"]!.map((x)=>Course.fromJson(x)).toList();
      break;
    case 2://المعرف الخاص بدبلوم الانجليزي
      computerCourses=Alnjahapi.englishCorsess["courses"]!.map((x)=>Course.fromJson(x)).toList();
      break;
    case 3://المعرف الخاص بدبلوم التدريب المهني
      computerCourses=Alnjahapi.corsess["courses"]!.map((x)=>Course.fromJson(x)).toList();
      break;
}}
  getSpecificCourseInformation({required String  courseName}){
  return allcourses.firstWhere((item) => item.courseName == courseName, /* orElse: () => null*/);

}

loadAllCoursesForSpecificDiploma({String })async{

  allcourses=await Alnjahapi.corsess["courses"]!.map((c)=>Course.fromJson(c)).toList();

}

 }
