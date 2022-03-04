// To parse this JSON data, do
//
//     final emailRegisterModel = emailRegisterModelFromJson(jsonString);

import 'dart:convert';

EmailRegisterModel emailRegisterModelFromJson(String str) => EmailRegisterModel.fromJson(json.decode(str));

String emailRegisterModelToJson(EmailRegisterModel data) => json.encode(data.toJson());

class EmailRegisterModel {
  EmailRegisterModel({
    required this.agreePrivacyPolicy,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.registrationType,
  });

  String agreePrivacyPolicy;
  String email;
  String password;
  String passwordConfirmation;
  String registrationType;

  factory EmailRegisterModel.fromJson(Map<String, dynamic> json) => EmailRegisterModel(
    agreePrivacyPolicy: json["agree_privacy_policy"],
    email: json["email"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    registrationType: json["registration_type"],
  );

  Map<String, dynamic> toJson() => {
    "agree_privacy_policy": agreePrivacyPolicy,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "registration_type": registrationType,
  };
}
