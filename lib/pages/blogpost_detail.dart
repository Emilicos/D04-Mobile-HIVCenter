import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/models/blogpost_model.dart';
import 'package:tk_akhir/widgets/drawer.dart';

class BlogpostDetail extends StatelessWidget {
  final BlogpostModel detail;

  const BlogpostDetail({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    Color importanceStyle = AppTheme.tagGreen;
    String importanceText = "Low";
    if (detail.fields.importance == "HH") {
      importanceStyle = AppTheme.tagRed;
      importanceText = "High";
    } else if (detail.fields.importance == "IM") {
      importanceStyle = AppTheme.tagYellow;
      importanceText = "Intermediate";
    } else {
      importanceStyle = AppTheme.tagGreen;
      importanceText = "Low";
    }
    return Scaffold(
      appBar: AppBar(title: Text(detail.fields.title)),
      drawer: const DrawerClass("Detail Blogpost"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  detail.fields.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    detail.fields.time.toString().substring(0, 10),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    importanceText,
                    style: TextStyle(
                        color: importanceStyle, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  detail.fields.opening,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  detail.fields.main,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  detail.fields.closing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
