class AdminModel {
  int? id;
  String? name;
  String? phone;
  String? statusName;

  AdminModel({this.id, this.name, this.phone, this.statusName});

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['statusName'] = this.statusName;
    return data;
  }
}
