class Cours {
  String? courId;
  String? courName;
  String? coursNameEn;
  String? description;
  String? period;
  String? batch;
  String? teachId;
  String? hours;
  String? startDate;
  String? endDate;
  String? cost;
  String? hasTest;
  String? logo;
  String? diplomId;
  String? studetLimit;

  Cours(
      {this.courId,
        this.courName,
        this.coursNameEn,
        this.description,
        this.period,
        this.batch,
        this.teachId,
        this.hours,
        this.startDate,
        this.endDate,
        this.cost,
        this.hasTest,
        this.logo,
        this.diplomId,
        this.studetLimit});

  Cours.fromJson(Map<String, dynamic> json) {
    courId = json['cour_id'];
    courName = json['cour_name'];
    coursNameEn = json['cours_nameEn'];
    description = json['description'];
    period = json['period'];
    batch = json['batch'];
    teachId = json['teach_id'];
    hours = json['hours'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    cost = json['cost'];
    hasTest = json['has_test'];
    logo = json['logo'];
    diplomId = json['diplom_id'];
    studetLimit = json['studet_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cour_id'] = this.courId;
    data['cour_name'] = this.courName;
    data['cours_nameEn'] = this.coursNameEn;
    data['description'] = this.description;
    data['period'] = this.period;
    data['batch'] = this.batch;
    data['teach_id'] = this.teachId;
    data['hours'] = this.hours;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['cost'] = this.cost;
    data['has_test'] = this.hasTest;
    data['logo'] = this.logo;
    data['diplom_id'] = this.diplomId;
    data['studet_limit'] = this.studetLimit;
    return data;
  }
}
