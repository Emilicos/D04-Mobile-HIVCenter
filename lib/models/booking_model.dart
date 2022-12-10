
// http://127.0.0.1:8000/booking/json/

// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
    BookingModel({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
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
        required this.doctor,
        required this.date,
        required this.time,
    });

    int user;
    String doctor;
    DateTime date;
    String time;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        doctor: json["doctor"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "doctor": doctor,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
    };
}
