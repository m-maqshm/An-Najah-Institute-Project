import 'package:an_najah_project/core/constant/http_urls.dart';
import 'package:an_najah_project/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:httpHelper/httpHelper.dart';

class UserVM{

  Future<void> login(String username, String password) async {
    final String url = 'https://dummyjson.com/auth/login';

    HttpHelper httpHelper=HttpHelper.instance;

    try {

       Response response=await httpHelper.getRequest(url: HttpUrls.login,data: {
        'username': username,
        'password': password,
      },);

      // التأكد من نجاح الطلب
      if (response.statusCode == 200) {
        // طباعة البيانات المستقبلة من السيرفر
        print('Login successful');
        print('Response data: ${response.data}');
      } else {
        print('Login failed with status: ${response.statusCode}');
      }
    } on httpHelperError catch (e) {
      // التعامل مع الأخطاء
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error sending request: ${e.message}');
      }
    }
  }
}