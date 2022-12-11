import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> deleteBlogpost(int id) async {
  // var url = Uri.parse('https://pbp-d04.up.railway.app/blogpost/delete/$id');
  var url = Uri.parse('https://pbp-d04.up.railway.app/blogpost/delete/$id/');
  final http.Response response = await http.delete(
    url,
  );
  return json.decode(response.body);
}
