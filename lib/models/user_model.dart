class UserModel {
  String? id;
  String? name;
  String? email;
  int? createAt;

  UserModel({this.id, this.name, this.email, this.createAt});

  UserModel.fromFireStore(Map<String, dynamic>? data)
    : this(
        id: data?["id"],
        name: data?["name"],
        email: data?["email"],
        createAt: data?["createAt"],
      );

  Map<String, dynamic> toFireStore() {
    return {"id": id, "name": name, "email": email, "createAt": createAt};
  }
}
