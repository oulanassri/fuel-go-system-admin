
class ServiceModel {
  final String? id,name;
  final String? price;
  ServiceModel({
    this.id,
    this.name,
    this.price,

  });
}

List servicesList = [
  ServiceModel(
    id: "1",
    name: "service name",
    price: "1",
  ),
  ServiceModel(
    id: "2",
    name: "service name",
    price: "1",
  ),
  ServiceModel(
    id: "3",
    name: "service name",
    price: "1\$",
  ),
];
