// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Services {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Services(this.id, this.title, this.description, this.imageUrl);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      map['id'] as String,
      map['title'] as String,
      map['description'] as String,
      map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) =>
      Services.fromMap(json.decode(source) as Map<String, dynamic>);
}
