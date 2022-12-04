import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/widgets/active_blogpost_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/tile_column.dart';
import 'package:tk_akhir/widgets/top_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'HIV CENTER',
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/TANGAN1.png',
            width: 700,
            height: 700,
          ),
          duration: 3000, //photo nya gmw gede wkwkkw
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: AppTheme.beige,
          nextScreen: const MyHomePage(
            title: '',
          ),
        ),
      ),
    );
  }
}

// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      drawer: DrawerClass('HIV CENTER'),
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
                              Container(
                                child: const Text(
                                  'Carlene Annabel',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'Pasien',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
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
                          TileColumn(
                            icon: CupertinoIcons.arrow_down_right,
                            iconBackgroundColor: AppTheme.darkBeige,
                            title: 'About Us',
                            subtitle: 'Lorem Ipsum',
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TileColumn(
                            icon: CupertinoIcons.arrow_down_right,
                            iconBackgroundColor: AppTheme.pink,
                            title: 'Misconceptions',
                            subtitle: 'Lorem Ipsum',
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('BlogPost'),
                          const SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveBlogpostCard(
                                cardColor: AppTheme.beige,
                                title:
                                    'Treating Addictions In Patients With HIV',
                                subtitle: 'hahahahaha',
                                user: "asdfadf",
                                date: "adsf",
                                importance: "adf",
                                pk: 2,
                              ),
                              const SizedBox(width: 20.0),
                              ActiveBlogpostCard(
                                  cardColor: AppTheme.beige,
                                  title: 'Judul',
                                  subtitle: 'hahahaha',
                                  user: "asdf",
                                  date: "adsf",
                                  importance: "adf",
                                  pk: 2),
                            ],
                          ),
                        ],
                      ),
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
