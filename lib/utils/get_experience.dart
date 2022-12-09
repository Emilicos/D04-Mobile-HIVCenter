import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/experience_models.dart';

List<Experience> listExperienceGlobal = [];

Future<List<Experience>> getExperience() async {
  listExperienceGlobal = [];

  var url = Uri.parse('https://pbp-d04.up.railway.app/experience/json/');
  var response = await http.get(
    url,
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Experience> listExperience = [];

  for (var d in data) {
    if (d != null) {
      listExperience.add(Experience.fromJson(d));
      listExperienceGlobal.add(Experience.fromJson(d));
    }
  }
  return listExperience;
}
