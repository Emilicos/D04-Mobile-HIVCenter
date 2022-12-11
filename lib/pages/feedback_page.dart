import 'package:tk_akhir/pages/add_feedback_page.dart';
import 'package:tk_akhir/pages/homepage.dart';
import 'package:tk_akhir/utils/fetch_feedback.dart';
import 'package:flutter/material.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/feedback_card.dart';
import 'package:tk_akhir/widgets/top_container.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerClass('Feedback'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopContainer(
                height: 210,
                width: width,
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
                          const Icon(Icons.search,
                              color: Colors.black, size: 25.0),
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
                                  'F E E D B A C K',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'Feedback Anda akan sangat membantu membangun kepercayaan orang lain terhadap kami  —HIVCenter',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16.0,
                                      fontFamily: 'cardo',
                                      color: Color.fromARGB(255, 32, 28, 28),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppTheme.tagRed)),
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
                                                .data[i].fields.username,
                                            description:
                                                snapshot.data[i].fields.description)
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
