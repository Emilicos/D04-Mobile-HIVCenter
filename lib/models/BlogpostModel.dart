import 'dart:convert';

List<BlogpostModel> blogpostModelFromJson(String str) =>
    List<BlogpostModel>.from(
        json.decode(str).map((x) => BlogpostModel.fromJson(x)));

String blogpostModelToJson(List<BlogpostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogpostModel {
  BlogpostModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory BlogpostModel.fromJson(Map<String, dynamic> json) => BlogpostModel(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.importance,
    required this.user,
    required this.time,
    required this.title,
    required this.opening,
    required this.main,
    required this.closing,
  });

  String importance;
  int user;
  DateTime time;
  String title;
  String opening;
  String main;
  String closing;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        importance: json["importance"],
        user: json["user"],
        time: DateTime.parse(json["time"]),
        title: json["title"],
        opening: json["opening"],
        main: json["main"],
        closing: json["closing"],
      );

  Map<String, dynamic> toJson() => {
        "importance": importance,
        "user": user,
        "time": time.toIso8601String(),
        "title": title,
        "opening": opening,
        "main": main,
        "closing": closing,
      };
}
