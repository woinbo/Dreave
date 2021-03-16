// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  String? id;
  String? email;
  String? displayName;
  String? photoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "displayName": displayName,
        "photoUrl": photoUrl,
      };
}
