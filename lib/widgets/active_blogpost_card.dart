import 'package:flutter/material.dart';
import 'package:tk_akhir/pages/login_page.dart';
import 'package:tk_akhir/utils/delete_blogpost.dart';

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
    super.key,
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
    final isButtonDisabled = userData['role'] == 2 ? false : true;
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
                              Visibility(
                                visible: !isButtonDisabled,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await deleteBlogpost(pk).then(
                                        (value) => {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  20, 5, 20, 5),
                                                          child: Center(
                                                              child: Text(
                                                            value['message'] ==
                                                                    'Delete berhasil'
                                                                ? 'Delete berhasil!'
                                                                : "Tidak bisa delete Item karena anda bukan user yang membuat!",
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            if (value[
                                                                    'message'] ==
                                                                'Delete berhasil') {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator
                                                                  .pushReplacementNamed(
                                                                      context,
                                                                      "/blogpost");
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Kembali'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            },
                                        onError: (error) => {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        const Center(
                                                            child: Text(
                                                                'Tidak bisa delete item')),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Kembali'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.redDelete),
                                  child: const Text("Delete"),
                                ),
                              )
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
