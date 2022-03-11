// To parse this JSON data, do
//
//     final emailRegisterModel = emailRegisterModelFromJson(jsonString);

import 'dart:convert';

EmailRegisterModel emailRegisterModelFromJson(String str) => EmailRegisterModel.fromJson(json.decode(str));

String emailRegisterModelToJson(EmailRegisterModel data) => json.encode(data.toJson());

class EmailRegisterModel {
  EmailRegisterModel({
    required this.token,
  });

  String token;

  factory EmailRegisterModel.fromJson(Map<String, dynamic> json) => EmailRegisterModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
