// To parse this JSON data, do
//
//     final experience = experienceFromJson(jsonString);

import 'dart:convert';

List<Experience> experienceFromJson(String str) => List<Experience>.from(json.decode(str).map((x) => Experience.fromJson(x)));

String experienceToJson(List<Experience> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Experience {
    Experience({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
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
        required this.user,
        required this.username,
        required this.posted,
        required this.title,
        required this.preview,
        required this.experience,
    });

    int user;
    String username;
    DateTime posted;
    String title;
    String preview;
    String experience;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        posted: DateTime.parse(json["posted"]),
        title: json["title"],
        preview: json["preview"],
        experience: json["experience"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "posted": posted.toIso8601String(),
        "title": title,
        "preview": preview,
        "experience": experience,
    };
}
