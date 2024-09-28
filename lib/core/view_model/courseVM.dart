 import 'package:an_najah_project/core/data/alnjahAPI.dart';
import 'package:an_najah_project/core/model/course.dart';

class Coursevm {
  List <Course> courses=[]; 
loadAllCoursesInThisDibloma(int id)
{

}

getSpecificCourseInformation(){}

loadAllCoursesForSpecificDiploma(){
  courses=Alnjahapi.corsess["course"]!.map((c)=>Course.fromJson(c)).toList();
print(courses);
}

 }