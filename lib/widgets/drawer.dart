import 'package:flutter/material.dart';
import 'package:tk_akhir/main.dart';
import 'package:tk_akhir/pages/BlogpostPage.dart';
import 'package:tk_akhir/pages/booking/BookingForm.dart';
import 'package:tk_akhir/pages/booking/BookingPage.dart';

class DrawerClass extends StatelessWidget {
  DrawerClass(this.currentPage);
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          // Adding clickable menu
          ListTile(
            title: const Text('HIV CENTER'),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == 'HIV CENTER') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: '',
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Blogpost'),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == 'HIV CENTER') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BlogpostPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Booking Page'),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == 'Booking Page') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BookingPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Booking Form'),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == 'Booking Form') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BookingForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
