// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.name,
    this.id,
    this.age,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
  });

  String? name;
  int? id;
  int? age;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        age: json["age"] == null ? null : json["age"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "age": age == null ? null : age,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
      };
}
