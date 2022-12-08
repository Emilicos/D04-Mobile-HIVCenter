
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tk_akhir/widgets/active_blogpost_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/tile_column.dart';
import 'package:tk_akhir/widgets/top_container.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerClass('Booking'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 210,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                  child: Icon(Icons.menu,
                                      color: Colors.black, size: 30.0),
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
                            progressColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            center: CircleAvatar(
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
                                cardColor: AppTheme.lightPink,
                                loadingPercent: 0.25, //buat level
                                title:
                                    'Treating Addictions In Patients With HIV',
                                subtitle: 'hahahahaha',
                              ),
                              SizedBox(width: 20.0),
                              ActiveBlogpostCard(
                                cardColor: AppTheme.darkBeige,
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

Text subheading(String title) {
  return Text(
    title,
    style: const TextStyle(
        fontSize: 25.0, fontWeight: FontWeight.w700, letterSpacing: 1.2),
  );
}