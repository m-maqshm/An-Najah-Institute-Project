import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/api_exception.dart';
import '../../helpers/http_helper.dart';
import '../constants/http_urls.dart';
import '../models/cors.dart';


class Coursesvm with ChangeNotifier {
  Coursesvm() {
    getCourses();
    // regesterdCourses(token: 'c83a40fcd638817330eecc7eb5f4fa93');

  }

  HttpHelper http = HttpHelper.instance;

  List<Cours> courses = [];


  void getCourses() async {
    try {
      Response res = await http.getRequest(url: HttpUrls.cours);
      courses = res.data['data'].map<Cours>((e) => Cours.fromJson(e)).toList();
      print("code ====== :" + res.statusCode.toString());
      notifyListeners();
    }
    catch (x) {
      print(" error= $x");
    }
  }

  Future<List<Cours>?> regesterdCourses() async {
    try {
      Response res = await http.postRequest(
          url: HttpUrls.precours, data: FormData.fromMap(
          {'token': "06a370a4335c7bca5cee3289c1e63207"}));


      List<Cours>? precourses = res.data['data'].map<Cours>((e) =>
          Cours.fromJson(e)).toList();
      return precourses;
    }
    catch (x) {
      print(" error= $x");
    }
    return null;
  }

  Future<String>? regsterationCours(
      {required String token, required String course_id}) async {
    try {
      Response res = await http.postRequest(
          url: HttpUrls.regsterationCours, data: FormData.fromMap(
          {'token': "857cf05ff082f0669e979b264aa4b459",
            'course_id': '$course_id'
          }
      ));
      print(course_id);
      print('eeeeeeeeeeeeeee $res');
      return res.data['code']=="200"?  "تم تسجيلك في هذا الكورس بنجاح":  "حدث خطأ ما، الرجاء المحاولة لاحقاً";
    } on DioException catch (x) {

      return ApiException.handleException(x);
    }
  }

}
