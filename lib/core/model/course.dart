class Course {
  String? courseName;
  int? hours;
  String? period;
  String? startDate;
  String? courseImage;
  int? fees;
  String? shortDescription;
  String? longDescription;

  Course(
      {this.courseName,
      this.hours,
      this.period,
      this.startDate,
      this.courseImage,
      this.fees,
      this.shortDescription,
      this.longDescription});

  Course.fromJson(Map<String, dynamic> json) {

    courseName = json['courseName'];
    hours = json['hours'];
    period = json['period'];
    startDate = json['startDate'];
    courseImage = json['courseImage'];
    fees = json['fees'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseName'] = this.courseName;
    data['hours'] = this.hours;
    data['period'] = this.period;
    data['startDate'] = this.startDate;
    data['courseImage'] = this.courseImage;
    data['fees'] = this.fees;
    data['shortDescription'] = this.shortDescription;
    data['longDescription'] = this.longDescription;
    return data;
  }
}
