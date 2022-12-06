import 'package:flutter/material.dart';
import 'package:tk_akhir/utils/deleteBlogpost.dart';

import '../app_theme.dart';

class ActiveBlogpostCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final String user;
  final String importance;
  final String date;
  final int pk;

  const ActiveBlogpostCard({
    required this.cardColor,
    required this.title,
    required this.subtitle,
    required this.user,
    required this.importance,
    required this.date,
    required this.pk,
  });

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();

    Color importanceStyle = AppTheme.tagGreen;
    String importanceWord = "";
    if (importance == "HH") {
      importanceWord = "High";
      importanceStyle = AppTheme.tagRed;
    } else if (importance == "IM") {
      importanceWord = "Intermediate";
      importanceStyle = AppTheme.tagYellow;
    } else {
      importanceWord = "Low";
      importanceStyle = AppTheme.tagGreen;
    }

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chip(
                label: Text(importanceWord,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                backgroundColor: importanceStyle),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppTheme.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              user,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  await deleteBlogpost(pk).then(
                                      (value) => {
                                            print(value.body),
                                            Navigator.popAndPushNamed(
                                                context, '/blogpost')
                                          },
                                      onError: (error) => {print(error)});
                                },
                                child: const Text("Delete"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.redDelete),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
