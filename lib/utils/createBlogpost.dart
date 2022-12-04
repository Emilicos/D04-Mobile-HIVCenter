import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createBlogPost(blogpostData) {
  // var url =
  //     Uri.parse('https://pbp-d04.up.railway.app/blogpost/');
  var url = Uri.parse('http://localhost:8000/blogpost/create/');
  var body = jsonEncode(blogpostData);
  var response = http.post(url, body: body);
  return response;
}

void initialPost(blogpostData) async {
  var res = await createBlogPost(blogpostData);
  print(res.body);
}
