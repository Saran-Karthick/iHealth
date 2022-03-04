// To parse this JSON data, do
//
//     final phoneRegisterModel = phoneRegisterModelFromJson(jsonString);

import 'dart:convert';

PhoneRegisterModel phoneRegisterModelFromJson(String str) => PhoneRegisterModel.fromJson(json.decode(str));

String phoneRegisterModelToJson(PhoneRegisterModel data) => json.encode(data.toJson());

class PhoneRegisterModel {
  PhoneRegisterModel({
    required this.agreePrivacyPolicy,
    required this.phone,
    required this.registrationType,
  });

  String agreePrivacyPolicy;
  String phone;
  String registrationType;

  factory PhoneRegisterModel.fromJson(Map<String, dynamic> json) => PhoneRegisterModel(
    agreePrivacyPolicy: json["agree_privacy_policy"],
    phone: json["phone"],
    registrationType: json["registration_type"],
  );

  Map<String, dynamic> toJson() => {
    "agree_privacy_policy": agreePrivacyPolicy,
    "phone": phone,
    "registration_type": registrationType,
  };
}
