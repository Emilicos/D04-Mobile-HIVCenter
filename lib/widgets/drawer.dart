import 'package:flutter/material.dart';
import 'package:tk_akhir/pages/blogpost_page.dart';
import 'package:tk_akhir/pages/booking_doctor_page.dart';
import 'package:tk_akhir/pages/booking_page.dart';
import 'package:tk_akhir/pages/experience/experience.dart';
import 'package:tk_akhir/pages/feedback_page.dart';
import 'package:tk_akhir/pages/login_page.dart';

class DrawerClass extends StatelessWidget {
  final String currentPage;
  const DrawerClass(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          // Adding clickable menu
          ListTile(
            title: const Text('HIV CENTER'),
            onTap: () {
              Navigator.of(context).pop();
              if (currentPage == 'HIV CENTER') return;

              Navigator.pushReplacementNamed(context, "/homepage");
            },
          ),
          ListTile(
            title: const Text('Blogpost'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/blogpost");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BlogpostPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Experience'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyExperiencePage(title: '')),
              );
            },
          ),
          ListTile(
            title: const Text('Booking'),
            onTap: () {
              if (userData['role'] == 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingPage()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingDoctorPage()));
              }
            },
          ),
          ListTile(
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/feedback");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const FeedbackPage(title: 'feedback')),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
