// To parse this JSON data, do
//
//     final phoneLoginModel = phoneLoginModelFromJson(jsonString);

import 'dart:convert';

PhoneLoginModel phoneLoginModelFromJson(String str) => PhoneLoginModel.fromJson(json.decode(str));

String phoneLoginModelToJson(PhoneLoginModel data) => json.encode(data.toJson());

class PhoneLoginModel {
  PhoneLoginModel({
    required this.token,
  });

  String token;

  factory PhoneLoginModel.fromJson(Map<String, dynamic> json) => PhoneLoginModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
