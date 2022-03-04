// To parse this JSON data, do
//
//     final phoneLoginModel = phoneLoginModelFromJson(jsonString);

import 'dart:convert';

PhoneLoginModel phoneLoginModelFromJson(String str) => PhoneLoginModel.fromJson(json.decode(str));

String phoneLoginModelToJson(PhoneLoginModel data) => json.encode(data.toJson());

class PhoneLoginModel {
  PhoneLoginModel({
    required this.authType,
    required this.phone,
  });

  String authType;
  String phone;

  factory PhoneLoginModel.fromJson(Map<String, dynamic> json) => PhoneLoginModel(
    authType: json["auth_type"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "auth_type": authType,
    "phone": phone,
  };
}
