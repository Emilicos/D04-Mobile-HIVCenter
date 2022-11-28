import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/pages/LoginPage.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w700, letterSpacing: 1.2),
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Builder(builder: (context) => GestureDetector(
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(Icons.menu, color: Colors.black, size: 30.0),
                        )),
                        
                        Icon(Icons.search, color: Colors.black, size: 25.0),
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
                            progressColor: AppTheme.lightPink,
                            backgroundColor: AppTheme.lightPink,
                            center: CircleAvatar(
                              backgroundColor: AppTheme.lightPink,
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
                                child: Text(
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
                                child: Text(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('HIV CENTER'),
                              
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TileColumn(
                            icon: CupertinoIcons.arrow_down_right,
                            iconBackgroundColor: AppTheme.darkBeige,
                            title: 'About Us',
                            subtitle: 'Lorem Ipsum',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TileColumn(
                            icon: CupertinoIcons.arrow_down_right,
                            iconBackgroundColor: AppTheme.pink,
                            title: 'Misconceptions',
                            subtitle: 'Lorem Ipsum',
                          ),
                          SizedBox(height: 15.0),
                          
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('BlogPost'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveBlogpostCard(
                                cardColor: AppTheme.pink,
                                loadingPercent: 0.25, //buat level
                                title: 'Treating Addictions In Patients With HIV',
                                subtitle: 'hahahahaha',
                              ),
                              SizedBox(width: 20.0),
                              ActiveBlogpostCard(
                                cardColor: AppTheme.pink,
                                loadingPercent: 0.6,
                                title: 'Judul',
                                subtitle: 'hahahaha',
                              ),
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
