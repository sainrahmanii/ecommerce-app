// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequestModel {
  final String email;
  final String name;
  final String password;
  final String username;

  RegisterRequestModel({
    required this.email,
    required this.name,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'username': username,
    };
  }

  String toJson() => json.encode(toMap());
}
