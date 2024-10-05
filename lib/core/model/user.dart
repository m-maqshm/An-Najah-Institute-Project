class User {
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;

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
        json['address'] != null ?  json['address']  : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    if (this.address != null) {
      data['address'] = this.address!;
    }
    return data;
  }
}
