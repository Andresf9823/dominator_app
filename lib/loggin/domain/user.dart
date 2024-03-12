class User {
  int id;
  String? name;
  String email;
  String password;
  String? phoneNumber;
  bool signed = false;

  User([this.id = 0, this.email = "", this.password = ""]);

  factory User.fromJson(Map<String, dynamic> json) {
    User user =  User();

    user.name = json['id'] ?? 0;
    user.name = json['name'] ?? "";
    user.email = json['email'] ?? "";
    user.password = json['password'] ?? "";
    user.phoneNumber = json['phoneNumber'] ?? "";
    user.signed = json['signed'] ?? false;
    return user;
  }
}
