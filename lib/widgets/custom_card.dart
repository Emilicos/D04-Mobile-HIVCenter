import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final String name;
  final String description;

  const CustomCard({Key? key, required this.name, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 52, 52),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 30),
                textAlign: TextAlign.left,
              ),

              Text(
                description,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 52, 52),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 15),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
