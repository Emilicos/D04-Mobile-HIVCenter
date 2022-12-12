import 'package:flutter/material.dart';

import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/experience/experience.dart';

class ExperienceDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String experience;

  const ExperienceDetailPage(
      {Key? key,
      required this.title,
      required this.author,
      required this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.beige,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          title,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.pink,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Flexible(child: 
                            Text(
                          experience,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                        ),)
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppTheme.darkBeige),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyExperiencePage(
                                            title: '',
                                          )));
                            },
                            child: const Text(
                              "Go Back",
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
