// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

List<Feedback> feedbackFromJson(String str) => List<Feedback>.from(json.decode(str).map((x) => Feedback.fromJson(x)));

String feedbackToJson(List<Feedback> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feedback {
    Feedback({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
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
        required this.title,
        required this.username,
        required this.description,
    });

    String title;
    String username;
    String description;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        username: json["username"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "username": username,
        "description": description,
    };
}