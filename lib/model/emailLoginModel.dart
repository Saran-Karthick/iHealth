// To parse this JSON data, do
//
//     final emailLoginModel = emailLoginModelFromJson(jsonString);

import 'dart:convert';

EmailLoginModel emailLoginModelFromJson(String str) => EmailLoginModel.fromJson(json.decode(str));

String emailLoginModelToJson(EmailLoginModel data) => json.encode(data.toJson());

class EmailLoginModel {
  EmailLoginModel({
    required this.authType,
    required this.email,
    required this.password,
  });

  String authType;
  String email;
  String password;

  factory EmailLoginModel.fromJson(Map<String, dynamic> json) => EmailLoginModel(
    authType: json["auth_type"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "auth_type": authType,
    "email": email,
    "password": password,
  };
}
