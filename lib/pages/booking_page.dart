import 'package:flutter/material.dart';
import 'package:tk_akhir/widgets/drawer.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);
  
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      drawer: const DrawerClass('Booking'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/create-booking');
        },
        child: const Text('Book an Appointment'),
      ),
    );
  }
}