import 'package:http/http.dart' as http;

Future<http.Response> deleteBlogpost(int id) async {
  // var url = Uri.parse('https://pbp-d04.up.railway.app/blogpost/delete/$id');
  var url = Uri.parse('https://pbp-d04.up.railway.app/blogpost/delete/$id');
  final http.Response response = await http.delete(
    url,
  );
  return response;
}
