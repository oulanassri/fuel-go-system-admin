class AdminModel {
  final String? id, name, email, phone, center;

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.center,

  });
}

List adminsList = [
  AdminModel(
      id: "1",
      name: "name",
      email: "example@gmail.com",
      phone: "12345678",
      center: "center",
      ),
  AdminModel(
      id: "3",
      name: "name",
      email: "example@gmail.com",
      phone: "12345678",
      center: "center",
     ),
  AdminModel(
    id: "2",
    name: "name",
    email: "example@gmail.com",
    phone: "12345678",
    center: "center",
  ),



];
