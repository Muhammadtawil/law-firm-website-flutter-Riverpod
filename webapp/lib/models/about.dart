// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class About {
  final String title;
  final String description;
  final String imageUrl;

  About(this.title, this.description, this.imageUrl);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory About.fromMap(Map<String, dynamic> map) {
    return About(
      map['title'] as String,
      map['description'] as String,
      map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory About.fromJson(String source) =>
      About.fromMap(json.decode(source) as Map<String, dynamic>);
}
