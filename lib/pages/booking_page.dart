import 'package:flutter/material.dart';
import 'package:tk_akhir/utils/fetch_booking.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/pages/login_page.dart';
import 'package:tk_akhir/app_theme.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);
  
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    
    final isButtonDisabled = userData['role'] == 2 ? true : false;

    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      drawer: const DrawerClass('Booking'),
      floatingActionButton: Visibility(
        visible: !isButtonDisabled,
        child: ElevatedButton(
          onPressed: () {
            !isButtonDisabled
              ? Navigator.popAndPushNamed(context, '/create-booking')
              : null;
          },
          child: Text(!isButtonDisabled ? 'Book an Appointment' : ''),
        ),
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
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppTheme.beige,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [

                    ]
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