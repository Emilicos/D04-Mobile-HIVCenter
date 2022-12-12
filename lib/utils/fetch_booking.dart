import 'package:tk_akhir/models/booking_model.dart';

List<BookingModel> listBookingUser = [];

Future<List<BookingModel>> fetchBooking(request) async {
  List<BookingModel> listBookingUser = [];

  var response = await request.get(
    'https://pbp-d04.up.railway.app/booking/json/',
  );

  print(response);
  List<BookingModel> listBooking = [];

  for (var d in response) {
    if (d != null) {
      listBooking.add(BookingModel.fromJson(d));
      listBookingUser.add(BookingModel.fromJson(d));
    }
  }
  return listBooking;
}
