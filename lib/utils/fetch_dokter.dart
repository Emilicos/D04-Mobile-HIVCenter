import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/dokter_model.dart';

List<DokterModel> listDokterAll = [];

List<String> listNamaDokter = [];

Future<List<String>> fetchDokter() async {
  print('fetched');
  
  List<DokterModel> listDokterAll = [];

  var url = Uri.parse('https://pbp-d04.up.railway.app/booking/nama_dokter/');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  print(data);

  List<DokterModel> listDokter = [];

  for (var d in data) {
      listDokter.add(DokterModel.fromJson(d));
      listDokterAll.add(DokterModel.fromJson(d));
  }

  print("list dokter " + listDokter.toString());
  print("list dokter all" + listDokterAll.toString());

  List<String> namaDokter = [];
  for (var dokter in listDokter) {
    namaDokter.add(dokter.fields.username);
  }

  return namaDokter;
}
