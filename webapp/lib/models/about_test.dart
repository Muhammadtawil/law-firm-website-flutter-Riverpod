// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAbout {
  final String name;
  final String email;

  UserAbout({required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory UserAbout.fromMap(Map<String, dynamic> map) {
    return UserAbout(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAbout.fromJson(String source) =>
      UserAbout.fromMap(json.decode(source) as Map<String, dynamic>);
}
