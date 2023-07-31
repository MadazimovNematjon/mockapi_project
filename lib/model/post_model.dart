// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  final String? title;
  final String? body;
  final String? id;

  Post({
    this.title,
    this.body,
    this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    title: json["title"],
    body: json["body"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "id": id,
  };
}
