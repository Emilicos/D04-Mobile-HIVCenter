import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/feedback_model.dart';

List<Feedback> listFeedbackGlobal = [];

Future<List<Feedback>> getFeedback() async {
  listFeedbackGlobal = [];

  var url = Uri.parse("https://pbp-d04.up.railway.app/feedback/json/");
  var response = await http.get(
    url,
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // print(json.decode(response.body));

  List<Feedback> listFeedback= [];

  for (var d in data) {
    if (d != null) {
      listFeedback.add(Feedback.fromJson(d));
      listFeedbackGlobal.add(Feedback.fromJson(d));
    }
  }
  // print(jsonDecode(utf8.decode(response.bodyBytes)));
  return listFeedback;
}
