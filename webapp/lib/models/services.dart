// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isAvailable;

  Services(
      this.id, this.title, this.description, this.imageUrl, this.isAvailable);

  final List<Services> _aboutList = [];

  List<Services> get aboutList {
    return [..._aboutList];
  }

// fetch Data
  Future<Stream> fetchData() async {
    final db = FirebaseFirestore.instance.collection("services");
    return db.snapshots();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      map['id'] as String,
      map['title'] as String,
      map['description'] as String,
      map['imageUrl'] as String,
      map['isAvailable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) =>
      Services.fromMap(json.decode(source) as Map<String, dynamic>);
}
