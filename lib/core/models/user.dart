
import 'academic_qualification.dart';

class User {
  String? arabicName;
  String? englishName;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;
  int? userId;

  String? dateOfBirth;
  String? profilePicture;
  AcademicQualification? academicQualification;

  User(
      {this.userId,
        this.englishName,
        this.arabicName,
        this.email,
        this.phoneNumber,
        this.dateOfBirth,
        this.profilePicture,
        this.address,
        this.academicQualification});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    arabicName = json['arabicName'];
    englishName=json['englishName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    profilePicture = json['profilePicture'];
    this.address =
    json['address'] != null ?  json['address']  : null;
    if (json['academicQualification'] != null) {

      academicQualification=new AcademicQualification.fromJson(json['academicQualification']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['arabicName'] = this.arabicName;
    data['englishName'] = this.englishName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['profilePicture'] = this.profilePicture;
    if (this.address != null) {
      data['address'] = this.address! ;
    }
    if (this.academicQualification != null) {
      data['academicQualification'] =
          this.academicQualification!.toJson();
    }
    return data;
  }

}


