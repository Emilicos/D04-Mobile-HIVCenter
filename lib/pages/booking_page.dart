import 'package:flutter/material.dart';
import 'package:tk_akhir/pages/add_booking_page.dart';
import 'package:tk_akhir/utils/fetch_booking.dart';
import 'package:tk_akhir/utils/fetch_booking_doctor.dart';
import 'package:tk_akhir/widgets/booking_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/pages/login_page.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);
  
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {

    return userData['role'] == 1 ? 

      // IF USER IS A PATIENT
      Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      drawer: const DrawerClass('Booking'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AddBookingPage()));
        },
        child: const Text('Book an Appointment'),
      ),
      body: FutureBuilder(
        future: fetchBooking(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());            
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
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: BookingCard(
                          judul: "Doctor: ${snapshot.data[i].fields.doctor}",
                          subjudul: "Date & Time: ${snapshot.data[i].fields.time} ${snapshot.data[i].fields.date.toString().substring(0, 11)}",
                        )
                      )
                    ]
                  ),
                ),
              );
            }
          }
        }
      ), 
    ) :

    // IF USER IS A DOCTOR
    Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      drawer: const DrawerClass('Booking'),
      body: FutureBuilder(
        future: fetchBookingDokter(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());            
          } else {
            if (!snapshot.hasData || snapshot.data.length == 0) {
              return Column(
                children: const [
                  Center(
                    child: BookingCard(
                      judul: 'No appointments yet',
                      subjudul: 'Come back later!'
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: BookingCard(
                      judul: "Appointment No. ${snapshot.data[i].pk}",
                      subjudul: "Date & Time: ${snapshot.data[i].fields.time} ${snapshot.data[i].fields.date.toString().substring(0, 11)}",
                    )
                  ),
                ),
              );
            }
          }
        }
      ), 
    );
  }
}