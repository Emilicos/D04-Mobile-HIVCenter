import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tk_akhir/widgets/custom_card.dart';
import 'package:tk_akhir/models/misconceptions_data.dart';
import '../../app_theme.dart';


class MisconceptionsPage extends StatelessWidget {
  const MisconceptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppTheme.lightPink, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9])),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            InkWell(
              child: SizedBox(
                height: 600,
                child: Swiper(
                  itemCount: Misconceptions.misconceptionsData.length,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height,
                  layout: SwiperLayout.TINDER,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: AppTheme.darkBeige,
                          activeColor: Colors.white,
                          activeSize: 12,
                          space: 4)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              CustomCard(
                                name: Misconceptions.misconceptionsData[index].name,
                                description : Misconceptions.misconceptionsData[index].description
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: Hero(
                                tag: Misconceptions.misconceptionsData[index].position,
                                child: Image.asset(Misconceptions.misconceptionsData[index].iconImage)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            )
          ],
        )),
      ),
    );
  }
}
