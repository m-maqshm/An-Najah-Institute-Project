import 'package:an_najah_project/core/constant/http_urls.dart';
import 'package:an_najah_project/helpers/http_helper.dart';
import 'package:dio/dio.dart';

class UserVM{

  Future<Object?> login({String? username, String? password}) async {


    HttpHelper httpHelper=HttpHelper.instance;

    try {

       Response response=await httpHelper.postRequest(url: HttpUrls.login,data: {
        'username': username,
        'password': password,
      },);

      // التأكد من نجاح الطلب
      if (response.statusCode == 200) {
        // طباعة البيانات المستقبلة من السيرفر
        print('Login successful');
        print('Response data: ${response.data}');
        return response.data ;
      } else {
        print('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // التعامل مع الأخطاء
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error sending request: ${e.message}');
      }
    }
    catch (e){
      print('Error sending request: ${e}');
    }
    return null;
  }
  Future<Object?> signup({required String fullName,required String email, required String password,required String phoneNo,required String address}) async {


    HttpHelper httpHelper=HttpHelper.instance;

    try {

      Response response=await httpHelper.postRequest(url: HttpUrls.signup,data: {
        'firstName': fullName,
        'password': password,
        'email': email,
        "username":"mssk407",
        "phone":phoneNo,
        "address": {"address": address}
        },
      );

      // التأكد من نجاح الطلب
      if (response.statusCode == 200) {
        // طباعة البيانات المستقبلة من السيرفر
        print('signup successful');
        print('Response data: ${response.data}');
        return response.data ;
      } else {
        print('Signup failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // التعامل مع الأخطاء
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error sending request: ${e.message}');
      }
    }
    catch (e){
      print('Error sending request: ${e}');
    }
    return null;
  }
}