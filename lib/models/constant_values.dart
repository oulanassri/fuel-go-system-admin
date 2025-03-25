class ConstantValuesModel {
  int? id;
  String? key;
  int? value;

  ConstantValuesModel({this.id, this.key, this.value});

  ConstantValuesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
