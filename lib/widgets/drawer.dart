import 'package:flutter/material.dart';

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

              Navigator.pushReplacementNamed(context, "/homepage");
            },
          ),
          ListTile(
            title: const Text('Blogpost'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/blogpost");
            },
          ),
        ],
      ),
    );
  }
}
