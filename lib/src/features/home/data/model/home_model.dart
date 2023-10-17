// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  HomeModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
