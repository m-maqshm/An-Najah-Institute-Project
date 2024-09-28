class User {
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  Address? address;

  User(
      {this.fullName,
      this.email,
      this.password,
      this.phoneNumber,
      this.address});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
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
