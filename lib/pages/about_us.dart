import 'package:flutter/material.dart';

import '../app_theme.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightPink,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Image(image: AssetImage('assets/images/asset1.png')),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "HIVCenter memiliki visi untuk menghilangkan stereotip yang melekat pada sebagian besar masyarakat Indonesia mengenai ODHA sekaligus meningkatkan kesadaran akan pentingnya pencegahan penyakit menular seksual. Selain itu, HIVCenter juga berharap dengan adanya aplikasi ini, ODHA dapat merasa lebih diterima tanpa adanya stereotip dari masyarakat pada umumnya. HIVCenter memiliki fitur-fitur yang dapat memberikan pengetahuan seputar HIV kepada pengguna yaitu :",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                          maxLines: 200,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "- forum untuk pengguna pasien guna saling bertukar pengalaman dan informasi seputar HIV",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "- fitur pengguna pasien untuk membuat reservasi atau booking kepada pengguna dokter untuk melakukan konsultasi atau pemeriksaan HIV.",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "- forum untuk pengguna yang dapat memberikan postingan seputar informasi HIV",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                        Text(
                          "- forum untuk pengguna yang dapat memberikan feedback",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        Text(
                          "Fitur-fitur tersebut disediakan sebagai upaya penyuluhan dan tindakan preventif HIV. Dengan adanya fitur-fitur yang disediakan pada HIVCenter diharapkan dapat mengedukasi masyarakat tentang info seputar HIV, dapat mengubah stigma negatif masyarakat terhadap pengidap HIV, dan juga yang paling penting adalah dapat mengurangi kasus HIV yang ada di Indonesia.",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                          maxLines: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
