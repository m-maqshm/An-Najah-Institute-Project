import 'dart:convert';

import 'package:an_najah_project/core/constant/http_urls.dart';
import 'package:an_najah_project/core/model/user.dart';
import 'package:an_najah_project/helpers/http_helper.dart';
import 'package:an_najah_project/helpers/storage_helper.dart';
import 'package:dio/dio.dart';

import '../model/academic_qualification.dart';

class UserVM {
  StorageHelper storageHelper = StorageHelper.instance;

  Future<String?> logout({required String token}) async{
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

        if (data['code'] == 200) {
          // تسجيل الدخول ناجح

          print('Logout successful!');
          storageHelper.writeKey('std_Id',null);
          storageHelper.writeKey('arabicName',null);
          storageHelper.writeKey('englishName',null);
          storageHelper.writeKey('email',null);
          storageHelper.writeKey('profilePicture',null);
          storageHelper.writeKey('phoneNumber',null);
          storageHelper.writeKey('dateOfBirth',null);
          storageHelper.writeKey('token',null);
          storageHelper.writeKey('address',null);
          storageHelper.writeKey('academicQualification',null) ;



          // حفظ بيانات المستخدم
          // User user = User.fromJson(data['user']);
          // await saveUserProfile(user);
          return token;
        } else {
          print('Login failed: ${data['message']}');
        }
      }
    } on DioError catch (e) {
      print('Error during login request: ${e.message}');
    }
    return null;
  }
  // تسجيل الدخول
  Future<String?> login({required String email, required String password}) async {
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

        if (data['code'] == 200) {
          // تسجيل الدخول ناجح
          String token = data['token'];
          print('Login successful! Token: $token');

          // حفظ بيانات المستخدم
          // User user = User.fromJson(data['user']);
          // await saveUserProfile(user);
          return token;
        } else {
          print('Login failed: ${data['message']}');
        }
      }
    } on DioError catch (e) {
      print('Error during login request: ${e.message}');
    }
    return null;
  }

  // التسجيل
 Future<String?> signup({
    required String fullName,
    required String email,
    required String password,
    required String phoneNo,
    required String address,
  }) async {
    HttpHelper httpHelper = HttpHelper.instance;

    try {
      Map<String, dynamic> data = {
        'name': fullName,
        'password': password,
        'email': email,
        "phone": phoneNo,
        'gender': "m"
      };

      Response response = await httpHelper.postRequest(
        url: HttpUrls.signup,
        data: FormData.fromMap(data),
      );

      if (response.statusCode == 200) {
        print('Signup successful');
        print('Response data: ${response.data}');

        // حفظ بيانات المستخدم بعد التسجيل
        // User user = User.fromJson(response.data['user']);
        // await saveUserProfile(user);
        return response.data['token'];
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
    return null;
  }

  // // حفظ معلومات المستخدم في GetStorage
  // Future<void> saveUserProfile(User user) async {
  //   storageHelper.writeKey('userId', user.userId.toString());
  //   storageHelper.writeKey('fullName', user. ?? '');
  //   storageHelper.writeKey('email', user.email ?? '');
  //   storageHelper.writeKey('phoneNumber', user.phoneNumber ?? '');
  //   storageHelper.writeKey('dateOfBirth', user.dateOfBirth ?? '');
  //   storageHelper.writeKey('profilePicture', user.profilePicture ?? '');
  //   storageHelper.writeKey('address', user.address ?? '');
  //   if (user.academicQualification != null) {
  //     storageHelper.writeKey('academicQualification', user.academicQualification!.toJson().toString());
  //   }
  // }

  // تحديث بيانات المستخدم في GetStorage
  Future<void> updateUserProfile({
    String? arabicName,
    String? englishName,
    String? email,
    String? phoneNumber,
    String? address,
    String? profilePicture,
  }) async {
    if (arabicName != null) storageHelper.writeKey('arabicName', arabicName);
    if (email != null) storageHelper.writeKey('email', email);
    if (phoneNumber != null) storageHelper.writeKey('phoneNumber', phoneNumber);
    if (address != null) storageHelper.writeKey('address', address);
    if (profilePicture != null) storageHelper.writeKey('profilePicture', profilePicture);
  }

  // استرجاع بيانات المستخدم من GetStorage fetch
  User getUserProfileFromLocalStorage() {
    return User(
      userId: int.tryParse(storageHelper.readKey('std_Id') ?? ''),
      arabicName: storageHelper.readKey('arabicName'),
      englishName: storageHelper.readKey('englishName'),
      email: storageHelper.readKey('email'),
      phoneNumber: storageHelper.readKey('phoneNumber'),
      dateOfBirth: storageHelper.readKey('dateOfBirth'),
      profilePicture: storageHelper.readKey('profilePicture'),
      address: storageHelper.readKey('address'),
      academicQualification: AcademicQualification.fromJson(
        storageHelper.readKey('academicQualification') != null
            ? storageHelper.readKey('academicQualification')
            : {},
      ),
    );
  }
    Future<String>fetchUserProfileFromAPI({required String token}) async{
      HttpHelper httpHelper = HttpHelper.instance;
      StorageHelper storageHelper=StorageHelper.instance;
      try {
        Response response = await httpHelper.postRequest(
          url: HttpUrls.profaile,
          data: FormData.fromMap({"token":token}),
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
        );

        if (response.statusCode == 200) {

          // print('Response data : ${response.data}');


            // تسجيل الدخول ناجح
            String token = response.data['data']['token'];

// ---------- save data come from API in local Storage ________

          storageHelper.writeKey('std_Id',response.data['data']['std_id']);
   storageHelper.writeKey('arabicName',response.data['data']['name_Ar']);
          storageHelper.writeKey('englishName',response.data['data']['name_En']);
          storageHelper.writeKey('email',response.data['data']['email']);
          storageHelper.writeKey('profilePicture',response.data['data']['photo']);
      storageHelper.writeKey('phoneNumber',response.data['data']['phone']);
  storageHelper.writeKey('dateOfBirth',response.data['data']['DOB']);
     storageHelper.writeKey('token',response.data['data']['token']);
      storageHelper.writeKey('address',response.data['data']['addrass']);
      storageHelper.writeKey('academicQualification',response.data['data']['qualification']) ;

          return('Data loaded successful! in token: ${response.data}');

        }
      } on DioError catch (e) {
        print('DioError during loaded data request: ${e.message}');
      } catch(e) {
        return 'Error during loaded data request: ${e}';
      }
      return 'Unhanding Error';
    }

}
