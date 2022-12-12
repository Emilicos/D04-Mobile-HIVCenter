import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/about_us.dart';
import 'package:tk_akhir/pages/login_page.dart';
import 'package:tk_akhir/pages/misconceptions.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/tile_column.dart';
import 'package:tk_akhir/widgets/top_container.dart';

// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return SplashScreen(
//     //   seconds: 4,
//     //   navigateAfterSeconds: new MyHomePage(title: ''),
//     //   title: new Text('HIV CENTER', textScaleFactor: 3,),
//     //   image: new Image.asset('assets/images/TANGAN1.png'),
//     //   photoSize: 200,
//     //   loaderColor: AppTheme.lightPink,

//     // );
//   }
// }

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w700, letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerClass('HIV CENTER'),
      body: SafeArea(
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
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            center: const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 100.0,
                              backgroundImage: AssetImage(
                                'assets/images/asset1.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                userData["username"],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                userData["role"] == 1 ? 'Pasien' : "Dokter",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('HIV CENTER'),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutUsPage())),
                            child: const TileColumn(
                              icon: CupertinoIcons.arrow_down_right,
                              iconBackgroundColor: AppTheme.darkBeige,
                              title: 'About Us',
                              subtitle: 'Know more about us!',
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MisconceptionsPage())),
                            child: const TileColumn(
                              icon: CupertinoIcons.arrow_down_right,
                              iconBackgroundColor: AppTheme.pink,
                              title: 'Misconceptions',
                              subtitle: 'Find out the facts',
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await request
                            .logout(
                                "https://pbp-d04.up.railway.app/authentication/logout/")
                            .then(
                                (value) =>
                                    {Navigator.popAndPushNamed(context, "/")},
                                onError: (error) => {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 15,
                                            child: ListView(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              shrinkWrap: true,
                                              children: <Widget>[
                                                const Center(
                                                    child: Text(
                                                        'Tidak bisa Logout')),
                                                const SizedBox(height: 20),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Kembali'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.tagRed),
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
