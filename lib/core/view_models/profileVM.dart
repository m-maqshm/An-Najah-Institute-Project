
import 'package:an_najah_project/helpers/massage_form.dart';
import 'package:dio/dio.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/storage_helper.dart';
import '../constants/http_urls.dart';
import 'userVM.dart';
class ProfileVM{
  UserVM userVM=UserVM();

  Future<bool> updateUserProfileAPI({
    String? arabicName,
    String? englishName,
    String? email,
    String? phoneNumber,
    String? address,
    String? profilePicture,
    String? academicQualtif,
    required String? token,
  }) async {
    StorageHelper storageHelper = StorageHelper.instance;
    HttpHelper httpHelper = HttpHelper.instance;
  // إعداد البيانات النهائية مع التحقق من القيم المخزنة في localStorage


    try {
      await userVM.fetchUserProfileFromAPI(token: "bd13312b8124f5b01b36cb093c318695");

      Map<String, dynamic> userData = {
        'name_Ar': arabicName ?? storageHelper.readKey('arabicName'),
        'name_En': englishName ?? storageHelper.readKey('englishName'),
        'email': email ?? storageHelper.readKey('email'),
        'phone': phoneNumber ?? storageHelper.readKey('phoneNumber'),
        'addrass': address ?? storageHelper.readKey('address'),
        'photo': profilePicture ?? storageHelper.readKey('profilePicture'),
        'token': "bd13312b8124f5b01b36cb093c318695",  // إرفاق الـ token للتوثيق
      };
      // إرسال البيانات إلى الـ API
      Response response = await httpHelper.postRequest(
        url: HttpUrls.editProfile, // ضع رابط الـ API الخاص بالتحديث هنا
        data: FormData.fromMap(userData),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print('Response data: $data');

        if (data['code'] == 200) {
          print('Profile update successful!');
          return true;
        } else {
          print('Profile update failed: ${data['message']}');
          return false;
        }
      }
    } on DioException catch (e) {
      print('Error during profile update request: ${e.message}');
      return false;
    }
    return false;
  }


  // MassageForm? massageForm;
  // Map<String,dynamic> userProfile={};
  // ProfileVM(){
  //   massageForm=MassageForm();
  // }

}








//
// editUserProfile({required Map<String,dynamic> profile}){
//
//   userProfile["userProfile"]["userId"]=profile["userId"];
//   userProfile["userProfile"]["fullNameArabic"]=profile["fullNameArabic"];
//   userProfile["userProfile"]["fullNameEnglish"]=profile["fullNameEnglish"];
//   userProfile["userProfile"]["email"]=profile["email"];
//   userProfile["userProfile"]["phoneNumber"]=profile["phoneNumber"];
//   userProfile["userProfile"]["dateOfBirth"]=profile["dateOfBirth"];
//   userProfile["userProfile"]["profilePicture"]=profile["profilePicture"];
//
//   userProfile["userProfile"]["address"]["province"]=profile["address"]["province"];
//   userProfile["userProfile"]["address"]["directorate"]=profile["address"]["directorate"];
//   userProfile["userProfile"]["address"]["city"]=profile["address"]["city"];
//   userProfile["userProfile"]["address"]["street"]=profile["address"]["street"];
//
//   userProfile["userProfile"]["AcademicQualification"]["degree"]=profile["AcademicQualification"]["degree"];
//   userProfile["userProfile"]["AcademicQualification"]["university"]=profile["AcademicQualification"]["university"];
//   userProfile["userProfile"]["AcademicQualification"]["startDate"]=profile["AcademicQualification"]["startDate"];
//   userProfile["userProfile"]["AcademicQualification"]["endDate"]=profile["AcademicQualification"]["endDate"];
// }

//
// gitUserProfile()=>userProfile;
// loadUserProfile(){
//   userProfile["userProfile"]["userId"]=Alnjahapi.profile["userProfile"]["userId"] ;
//   userProfile["userProfile"]["fullNameArabic"]=Alnjahapi.profile["userProfile"]["fullNameArabic"] ;
//   userProfile["userProfile"]["fullNameEnglish"]=Alnjahapi.profile["userProfile"]["fullNameEnglish"];
//   userProfile["userProfile"]["email"]=Alnjahapi.profile["userProfile"]["email"] ;
//   userProfile["userProfile"]["phoneNumber"]=Alnjahapi.profile["userProfile"]["phoneNumber"] ;
//   userProfile["userProfile"]["dateOfBirth"]=Alnjahapi.profile["userProfile"]["dateOfBirth"] ;
//   userProfile["userProfile"]["profilePicture"]=Alnjahapi.profile["userProfile"]["profilePicture"];
//
//   userProfile["userProfile"]["address"]["province"]=Alnjahapi.profile["userProfile"]["address"]["province"] ;
//   userProfile["userProfile"]["address"]["directorate"]=Alnjahapi.profile["userProfile"]["address"]["directorate"];
//   userProfile["userProfile"]["address"]["city"]=Alnjahapi.profile["userProfile"]["address"]["city"] ;
//   userProfile["userProfile"]["address"]["street"]=Alnjahapi.profile["userProfile"]["address"]["street"] ;
//
//   userProfile["userProfile"]["AcademicQualification"]["degree"]=Alnjahapi.profile["userProfile"]["AcademicQualification"]["degree"];
//   userProfile["userProfile"]["AcademicQualification"]["university"]=Alnjahapi.profile["userProfile"]["AcademicQualification"]["university"] ;
//   userProfile["userProfile"]["AcademicQualification"]["startDate"]=Alnjahapi.profile["userProfile"]["AcademicQualification"]["startDate"];
//   userProfile["userProfile"]["AcademicQualification"]["endDate"]=Alnjahapi.profile["userProfile"]["AcademicQualification"]["endDate"];
// massageForm?.data=userProfile["userProfile"];
//
// }