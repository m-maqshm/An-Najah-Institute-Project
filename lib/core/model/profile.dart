class profile {
  int? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? profilePicture;
  Address? address;
  List<AcademicQualification>? academicQualification;

  profile(
      {this.userId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.dateOfBirth,
      this.profilePicture,
      this.address,
      this.academicQualification});

  profile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    profilePicture = json['profilePicture'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['academicQualification'] != null) {
      academicQualification = <AcademicQualification>[];
      json['academicQualification'].forEach((v) {
        academicQualification!.add(new AcademicQualification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['profilePicture'] = this.profilePicture;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.academicQualification != null) {
      data['academicQualification'] =
          this.academicQualification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? country;
  String? postalCode;

  Address({this.street, this.city, this.country, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    return data;
  }
}

class AcademicQualification {
  String? degree;
  String? university;
  String? startDate;
  String? endDate;

  AcademicQualification(
      {this.degree, this.university, this.startDate, this.endDate});

  AcademicQualification.fromJson(Map<String, dynamic> json) {
    degree = json['degree'];
    university = json['university'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['degree'] = this.degree;
    data['university'] = this.university;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}
