import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/api_exception.dart';
import '../../helpers/http_helper.dart';
import '../../helpers/storage_helper.dart';
import '../constants/http_urls.dart';
import '../models/cors.dart';


class Coursesvm with ChangeNotifier {
  static StorageHelper storageHelper = StorageHelper.instance;

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

  Future<List<Cours>?> getCrentCours({required int x}) async {
    try {
      Response res = await http.getRequest(url: HttpUrls.cours);
      List<Cours> cours = res.data['data'].map<Cours>((e) => Cours.fromJson(e)).toList();
      print("code ====== :" + res.statusCode.toString());
      notifyListeners();
      return cours.where((e) => e.diplomId == x.toString()).toList();
    }
    catch (x) {
      print(" error= $x");
    }
  }
  
  Future<List<Cours>?> regesterdCourses() async {
    try {
      Response res = await http.postRequest(
          url: HttpUrls.precours, data: FormData.fromMap(
          {'token': "${storageHelper.readKey('token').toString()}"}));


      List<Cours>? precourses = res.data['data'].map<Cours>((e) =>
          Cours.fromJson(e)).toList();
      return precourses;
    }
    catch (x) {
      print(" error= $x");
    }
  }

  Future<String>? regsterationCours(
      {required String token, required String course_id}) async {
    try {
      Response res = await http.postRequest(
          url: HttpUrls.regsterationCours, data: FormData.fromMap(
          {'token': "${storageHelper.readKey('token').toString()}",
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
