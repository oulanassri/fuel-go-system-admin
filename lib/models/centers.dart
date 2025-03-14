class CentersModel {
  int? id;
  String? neighborhoodName;
  String? phone;
  String? name;
  double? lat;
  double? long;
  String? locationDescription;

  CentersModel(
      {this.id,
        this.neighborhoodName,
        this.phone,
        this.name,
        this.lat,
        this.long,
        this.locationDescription});

  CentersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    neighborhoodName = json['neighborhoodName'];
    phone = json['phone'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    locationDescription = json['locationDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['neighborhoodName'] = this.neighborhoodName;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['locationDescription'] = this.locationDescription;
    return data;
  }
}
