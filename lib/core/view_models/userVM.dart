import 'dart:convert';


import 'package:an_najah_project/helpers/http_helper.dart';
import 'package:an_najah_project/helpers/storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constants/http_urls.dart';
import '../models/academic_qualification.dart';
import '../models/user.dart';

class UserVM with ChangeNotifier {
  StorageHelper storageHelper = StorageHelper.instance;

  Future<bool?> logout({required String token}) async{
    HttpHelper httpHelper = HttpHelper.instance;

    Map<String, String> queryParams = {
      'token': token,
    };

    try {
      Response response = await httpHelper.postRequest(
        url: HttpUrls.logout,
        data: FormData.fromMap(queryParams),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print('Response data: $data');

        if (data['code'] == "200") {
          // تسجيل الخروج ناجح
          print('Logout successful!');
          // مسح البيانات من التخزين المحلي
          storageHelper.removeAll();
          notifyListeners();

          // storageHelper.writeKey('std_Id', null);
          // storageHelper.writeKey('Id-card', null);
          // storageHelper.writeKey('arabicName', null);
          // storageHelper.writeKey('englishName', null);
          // storageHelper.writeKey('email', null);
          // storageHelper.writeKey('profilePicture', null);
          // storageHelper.writeKey('phoneNumber', null);
          // storageHelper.writeKey('dateOfBirth', null);
          // storageHelper.writeKey('token', null);
          // storageHelper.writeKey('address', null);
          // storageHelper.writeKey('academicQualification', null);

          return true;
        } else {
          print('Logout failed: ${data['message']}');
        }
      }
    } on DioError catch (e) {
      print('Error during logout request: ${e.message}');
    }
    return false;
  }

  // تسجيل الدخول
  Future<bool?> login({required String email, required String password}) async {
    HttpHelper httpHelper = HttpHelper.instance;

    Map<String, String> queryParams = {
      'email': email,
      'password': password,
    };

    try {
      Response response = await httpHelper.postRequest(
        url: HttpUrls.login,
        data: FormData.fromMap(queryParams),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print('Response data: $data');

        if (response.data['code'] == "200") {
          // تسجيل الدخول ناجح
          String token = response.data['token'];
          print('Login successful! Token: $token');

          fetchUserProfileFromAPI(token: token);

          return true;
        } else {
          print('Login failed: ${data['message']}');
          return false;
        }
      }
    } on DioError catch (e) {
      print('Error during login request: ${e.message}');
      return false;
    }
    return false;
  }

  // التسجيل
  Future<bool> signup({
    required String arabicName,
    required String email,
    required String password,
    required String phoneNo,
    required String address,
    required String gender,
  }) async {
    HttpHelper httpHelper = HttpHelper.instance;

    try {
      Map<String, dynamic> data = {
        'name': arabicName,
        'password': password,
        'email': email,
        "phone": phoneNo,
        'gender': gender
      };

      Response response = await httpHelper.postRequest(
        url: HttpUrls.signup,
        data: FormData.fromMap(data),
      );

      if (response.statusCode == 200) {
        print('Signup successful');
        print('Response data: ${response.data}');

        return true;
      } else {
        print('Signup failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error sending request: ${e.message}');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
    return false;
  }

  // تحميل ملف المستخدم من API
  Future<bool> fetchUserProfileFromAPI({required String token}) async {
    HttpHelper httpHelper = HttpHelper.instance;
    StorageHelper storageHelper = StorageHelper.instance;

    try {
      Response response = await httpHelper.postRequest(
        url: HttpUrls.profile,
        data: FormData.fromMap({"token": token}),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        // حفظ البيانات في التخزين المحلي
        storageHelper.writeKey('std_Id', response.data['data']['std_id']);
        storageHelper.writeKey('arabicName', response.data['data']['name_Ar']);
        storageHelper.writeKey('englishName', response.data['data']['name_En']);
        storageHelper.writeKey('email', response.data['data']['email']);
        storageHelper.writeKey('profilePicture', response.data['data']['photo']);
        storageHelper.writeKey('phoneNumber', response.data['data']['phone']);
        storageHelper.writeKey('dateOfBirth', response.data['data']['DOB']);
        storageHelper.writeKey('Id-card', response.data['data']['Id-card']);
        storageHelper.writeKey('token', response.data['data']['token']);//"Id-card"
        storageHelper.writeKey('address', response.data['data']['addrass']);
        storageHelper.writeKey('academicQualification', response.data['data']['qualification']);

        return true;
      }
    } on DioException catch (e) {
      print('Error during fetching profile: ${e.message}');
    } catch (e) {
      print('Error during fetching profile: $e');
    }
    return false;
  }
}