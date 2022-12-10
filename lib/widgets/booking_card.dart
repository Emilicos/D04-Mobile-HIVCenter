import 'package:flutter/material.dart';

import '../app_theme.dart';

class BookingCard extends StatelessWidget {
  final String judul;
  final String subjudul;

  const BookingCard({Key? key, required this.judul, required this.subjudul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 300,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: AppTheme.beige,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Text(
                judul,
                style: const TextStyle(
                    color: AppTheme.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              const SizedBox(height: 10.0),
              Text(
                subjudul,
                style: const TextStyle(
                    color: AppTheme.grey,
                    fontWeight: FontWeight.w200,
                    fontSize: 18),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: const [
              //     Text(
              //       "Know More",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: 'Avenir',
              //           fontSize: 12),
              //       textAlign: TextAlign.left,
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 5.0),
              //       child: Icon(
              //         Ionicons.arrow_forward,
              //         color: AppTheme.darkBeige,
              //         size: 20,
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
