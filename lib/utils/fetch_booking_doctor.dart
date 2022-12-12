import 'package:tk_akhir/models/booking_model.dart';

List<BookingModel> listBookingUser = [];

Future<List<BookingModel>> fetchBookingDokter(request) async {
  List<BookingModel> listBookingDokter = [];

  var response =
      await request.get('https://pbp-d04.up.railway.app/booking/appointment/');

  List<BookingModel> listBooking = [];

  for (var d in response) {
    if (d != null) {
      listBooking.add(BookingModel.fromJson(d));
      listBookingDokter.add(BookingModel.fromJson(d));
    }
  }
  return listBooking;
}
