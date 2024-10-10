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