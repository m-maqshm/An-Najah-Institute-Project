
import 'package:an_najah_project/helpers/massage_form.dart';

class ProfileVM{
  MassageForm? massageForm;
  Map<String,dynamic> userProfile={};
  ProfileVM(){
massageForm=MassageForm();
  }

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

  editUserProfile({required Map<String,dynamic> profile}){

    userProfile["userProfile"]["userId"]=profile["userId"];
    userProfile["userProfile"]["fullNameArabic"]=profile["fullNameArabic"];
    userProfile["userProfile"]["fullNameEnglish"]=profile["fullNameEnglish"];
    userProfile["userProfile"]["email"]=profile["email"];
    userProfile["userProfile"]["phoneNumber"]=profile["phoneNumber"];
    userProfile["userProfile"]["dateOfBirth"]=profile["dateOfBirth"];
    userProfile["userProfile"]["profilePicture"]=profile["profilePicture"];

    userProfile["userProfile"]["address"]["province"]=profile["address"]["province"];
    userProfile["userProfile"]["address"]["directorate"]=profile["address"]["directorate"];
    userProfile["userProfile"]["address"]["city"]=profile["address"]["city"];
    userProfile["userProfile"]["address"]["street"]=profile["address"]["street"];

    userProfile["userProfile"]["AcademicQualification"]["degree"]=profile["AcademicQualification"]["degree"];
    userProfile["userProfile"]["AcademicQualification"]["university"]=profile["AcademicQualification"]["university"];
    userProfile["userProfile"]["AcademicQualification"]["startDate"]=profile["AcademicQualification"]["startDate"];
    userProfile["userProfile"]["AcademicQualification"]["endDate"]=profile["AcademicQualification"]["endDate"];
     }
}