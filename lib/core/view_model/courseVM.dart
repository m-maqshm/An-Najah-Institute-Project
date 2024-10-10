 import 'package:an_najah_project/core/data/alnjahAPI.dart';
import 'package:an_najah_project/core/model/course.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/http_helper.dart';
import '../constant/http_urls.dart';
import '../models/cors.dart';
 class Coursesvm with ChangeNotifier {
   Coursesvm() {
     getCourses();
   }
   HttpHelper http=HttpHelper.instance;

   List<Cours> courses = [] ;
   void getCourses ( )  async{
     print("kll");
     try{
       Dio d=Dio();
     Response res=await d.get( HttpUrls.cours );

     courses = res.data['data'].map<Cours>((e)=>Cours.fromJson(e)).toList();}

     catch(x){
     print(" x =$x");
   }
     notifyListeners();

   }

 }
