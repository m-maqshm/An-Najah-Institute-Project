class Cerificat {
  String? id;
  String? certfcatNO;
  String? dateofgenrat;
  String? regId;
  String? courseName;
  String? studentName;

  Cerificat(
      {this.id,
        this.certfcatNO,
        this.dateofgenrat,
        this.regId,
        this.courseName,
        this.studentName});

  Cerificat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certfcatNO = json['certfcatNO'];
    dateofgenrat = json['dateofgenrat'];
    regId = json['reg_id'];
    courseName = json['course_name'];
    studentName = json['student_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['certfcatNO'] = this.certfcatNO;
    data['dateofgenrat'] = this.dateofgenrat;
    data['reg_id'] = this.regId;
    data['course_name'] = this.courseName;
    data['student_name'] = this.studentName;
    return data;
  }
}
