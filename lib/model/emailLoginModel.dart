// To parse this JSON data, do
//
//     final emailLoginModel = emailLoginModelFromJson(jsonString);

import 'dart:convert';

EmailLoginModel emailLoginModelFromJson(String str) => EmailLoginModel.fromJson(json.decode(str));

String emailLoginModelToJson(EmailLoginModel data) => json.encode(data.toJson());

class EmailLoginModel {
  EmailLoginModel({
    required this.token,
  });

  String token;

  factory EmailLoginModel.fromJson(Map<String, dynamic> json) => EmailLoginModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
