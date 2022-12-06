import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Uri url = Uri.parse(
                        "https://pbp-d04.up.railway.app/authentication/registerpasien/");
                    launchUrl(url);
                  },
                  child: const Text("Register sebagai Pasien",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Uri url = Uri.parse(
                        "https://pbp-d04.up.railway.app/authentication/registerdokter/");
                    launchUrl(url);
                  },
                  child: const Text("Register sebagai Dokter",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ],
    );
  }
}
