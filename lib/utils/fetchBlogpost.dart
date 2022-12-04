import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/BlogpostModel.dart';

List<BlogpostModel> listBlogpostGlobal = [];

Future<List<BlogpostModel>> fetchBlogpost() async {
  // var url =
  //     Uri.parse('https://pbp-d04.up.railway.app/blogpost/json?importance=DT');
  var url = Uri.parse('http://localhost:8000/blogpost/json?importance=DT');
  var response = await http.get(
    url,
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<BlogpostModel> listBlogpost = [];

  for (var d in data) {
    if (d != null) {
      listBlogpost.add(BlogpostModel.fromJson(d));
      listBlogpostGlobal.add(BlogpostModel.fromJson(d));
    }
  }
  return listBlogpost;
}
