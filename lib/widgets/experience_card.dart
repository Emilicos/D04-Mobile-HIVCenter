import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../app_theme.dart';

class ExperienceCard extends StatelessWidget {
  final String judul;
  final String author;

  const ExperienceCard({Key? key, required this.judul, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: AppTheme.beige,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 52, 52),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Text(
                author,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 52, 52),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 18),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Know More",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Avenir',
                        fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Ionicons.arrow_forward,
                      color: AppTheme.darkBeige,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
