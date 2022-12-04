import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/AddBlogPage.dart';
import 'package:tk_akhir/pages/BlogpostDetail.dart';
import 'package:tk_akhir/utils/fetchBlogpost.dart';
import 'package:tk_akhir/widgets/active_blogpost_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';

class BlogpostPage extends StatefulWidget {
  const BlogpostPage({Key? key}) : super(key: key);

  @override
  State<BlogpostPage> createState() => _BlogpostPageState();
}

class _BlogpostPageState extends State<BlogpostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Blogpost")),
        drawer: DrawerClass("Blogpost"),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AddBlogPage()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.tagGreen),
          child: const Text("Add Blog"),
        ),
        body: FutureBuilder(
          future: fetchBlogpost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak Blogpost yang Dibuat :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, i) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogpostDetail(
                                      detail: listBlogpostGlobal[i])),
                            );
                          },
                          child: Row(
                            children: [
                              ActiveBlogpostCard(
                                  cardColor: AppTheme.beige,
                                  importance: snapshot
                                      .data[i].fields.importance,
                                  title: snapshot.data[i].fields.title,
                                  subtitle:
                                      snapshot.data[i].fields.opening.length >
                                              100
                                          ? snapshot.data[i].fields.opening
                                                  .substring(0, 100) +
                                              "..."
                                          : snapshot.data[i].fields.opening,
                                  user: snapshot.data[i].fields.username,
                                  date: snapshot.data[i].fields.time
                                      .toString()
                                      .substring(0, 10),
                                  pk: snapshot.data[i].pk),
                            ],
                          ),
                        )));
              }
            }
          },
        ));
  }
}
