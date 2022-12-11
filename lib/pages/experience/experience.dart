import 'package:flutter/material.dart';
import 'package:tk_akhir/pages/experience/add_experience.dart';
import 'package:tk_akhir/pages/experience/experience_detail.dart';
import 'package:tk_akhir/utils/get_experience.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/experience_card.dart';
import 'package:tk_akhir/widgets/top_container.dart';

import '../../app_theme.dart';

class MyExperiencePage extends StatefulWidget {
  const MyExperiencePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyExperiencePage> createState() => _MyExperiencePageState();
}

class _MyExperiencePageState extends State<MyExperiencePage> {
  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w700, letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerClass('Experience'),
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
                                  'EXPERIENCE',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'Add yours',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
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
                    backgroundColor: MaterialStateProperty.all(AppTheme.pink),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddExperiencePage()));
                  },
                  child: const Text(
                    "Add Experience",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: getExperience(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Belum ada experience, Tambahkan milikmu!",
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ExperienceDetailPage(
                                                  author: snapshot
                                                      .data[i].fields.username,
                                                  title: snapshot
                                                      .data[i].fields.title,
                                                  experience: snapshot.data[i]
                                                      .fields.experience,
                                                )),
                                      );
                                    },
                                    child: Column(children: [
                                      ExperienceCard(
                                          judul: snapshot.data[i].fields.title,
                                          // ignore: prefer_interpolation_to_compose_strings
                                          author: "by: " +
                                              snapshot.data[i].fields.username),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                                  )));
                        }
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
