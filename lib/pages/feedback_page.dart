import 'package:flutter/material.dart';
import 'package:tk_akhir/pages/add_feedback_page.dart';
import 'package:tk_akhir/utils/fetch_feedback.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/feedback_card.dart';

import '../../app_theme.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerClass('Feedback'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.tagRed)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddFeedbackPage()));
                  },
                  child: const Text(
                    "Add Feedback",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: getFeedback(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return Column(
                              children: const [
                                Text(
                                  "Tidak ada feedback yang tersedia.",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, i) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: GestureDetector(
                                      child: Column(children: [
                                        FeedbackCard(
                                            title:
                                                snapshot.data[i].fields.title,
                                            username: snapshot
                                                    .data[i].fields.anonymous
                                                ? "anonymous"
                                                : "idk",
                                            description: snapshot
                                                .data[i].fields.description)
                                      ]),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                    )));
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
