import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/add_booking_page.dart';
import 'package:tk_akhir/utils/fetch_booking_doctor.dart';
import 'package:tk_akhir/widgets/booking_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';

import '../widgets/top_container.dart';


class BookingDoctorPage extends StatefulWidget {
  const BookingDoctorPage({Key? key}) : super(key: key);
  
  @override
  State<BookingDoctorPage> createState() => _BookingDoctorState();
}

class _BookingDoctorState extends State<BookingDoctorPage> {
  @override
  Widget build(BuildContext context) {

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
                                  'APPOINTMENTS LIST',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
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

              SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
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
                              shrinkWrap: true,
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
                  ],
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}

