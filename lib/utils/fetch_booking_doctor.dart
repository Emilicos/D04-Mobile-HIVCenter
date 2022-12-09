import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tk_akhir/models/booking_model.dart';

List<BookingModel> listBookingUser = [];

Future<List<BookingModel>> fetchBookingDokter() async {
  List<BookingModel> listBookingDokter = [];

  var url = Uri.parse('https://pbp-d04.up.railway.app/booking/appointment/');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<BookingModel> listBooking = [];

  for (var d in data) {
    if (d != null) {
      listBooking.add(BookingModel.fromJson(d));
      listBookingDokter.add(BookingModel.fromJson(d));
    }
  }
  return listBooking;
}