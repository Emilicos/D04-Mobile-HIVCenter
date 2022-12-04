import 'package:flutter/material.dart';
import 'package:tk_akhir/main.dart';
import 'package:tk_akhir/pages/BlogpostPage.dart';

class DrawerClass extends StatelessWidget {
  DrawerClass(this.currentPage);
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          // Adding clickable menu
          ListTile(
            title: const Text('HIV CENTER'),
            onTap: () {
              Navigator.of(context).pop();
              if (currentPage == 'HIV CENTER') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: '',
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Blogpost'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BlogpostPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
