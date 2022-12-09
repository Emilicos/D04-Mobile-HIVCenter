import 'package:flutter/material.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/blogpost_detail.dart';
import 'package:tk_akhir/utils/fetch_blogpost.dart';
import 'package:tk_akhir/widgets/active_blogpost_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';

import '../widgets/top_container.dart';

class BlogpostPage extends StatefulWidget {
  const BlogpostPage({Key? key}) : super(key: key);

  @override
  State<BlogpostPage> createState() => _BlogpostPageState();
}

class _BlogpostPageState extends State<BlogpostPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // final request = context.watch<CookieRequest>();

    return Scaffold(
        // appBar: AppBar(title: const Text("Blogpost")),
        drawer: const DrawerClass("Blogpost"),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/create-blogpost");
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.tagGreen),
          child: const Text("Add Blog"),
        ),
        body: Column(
          children: [
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
                                'BLOGPOST',
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
                    ),
                  ]),
            ),
            FutureBuilder(
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
                          style:
                              TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                                      importance:
                                          snapshot.data[i].fields.importance,
                                      title: snapshot.data[i].fields.title,
                                      subtitle: snapshot.data[i].fields.opening
                                                  .length >
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
            )
          ],
        ));
  }
}
