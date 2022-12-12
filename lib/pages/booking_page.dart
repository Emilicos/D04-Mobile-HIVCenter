import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/add_booking_page.dart';
import 'package:tk_akhir/utils/fetch_booking.dart';
import 'package:tk_akhir/widgets/booking_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';

import '../widgets/top_container.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      drawer: const DrawerClass('Booking'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 210,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Builder(
                            builder: (context) => GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: const Icon(Icons.menu,
                                      color: Colors.black, size: 30.0),
                                )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'APPOINTMENTS BOOKING',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Book An Appointment',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20.0),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.pink),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddBookingPage()));
                },
                child: const Text(
                  "Book Here!",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(height: 20.0),
            SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: fetchBooking(request),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return Column(
                              children: const [
                                Text('No appointments have been booked yet'),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, i) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                    child: BookingCard(
                                  judul:
                                      "Doctor: ${snapshot.data[i].fields.doctor}",
                                  subjudul:
                                      "Date & Time: ${snapshot.data[i].fields.time} ${snapshot.data[i].fields.date.toString().substring(0, 11)}",
                                )),
                              ),
                            );
                          }
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
