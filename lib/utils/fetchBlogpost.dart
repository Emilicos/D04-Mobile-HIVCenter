import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/BlogpostModel.dart';

List<BlogpostModel> listBlogpostGlobal = [];

Future<List<BlogpostModel>> fetchMyWatchList() async {
  var url = Uri.parse('https://pbp-d04.up.railway.app/blogpost/json/');
  var response = await http.get(
    url,
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<BlogpostModel> listBlogpost = [];
  for (var d in data) {
    if (d != null) {
      listBlogpost.add(BlogpostModel.fromJson(d));
      listBlogpost.add(BlogpostModel.fromJson(d));
    }
  }
  return listBlogpost;
}
