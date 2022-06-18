import 'dart:math';
import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_colors.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/constants/app_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class EpicGameScreen extends StatefulWidget {
  const EpicGameScreen({Key? key}) : super(key: key);

  @override
  State<EpicGameScreen> createState() => _EpicGameScreenState();
}

class _EpicGameScreenState extends State<EpicGameScreen> {
  double _dotPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: AppDimens.margin_medium_3x),
          Container(
            width: double.infinity,
            height: AppDimens.height_free_game_banner,
            child: PageView.builder(
              itemCount: 5,
              itemBuilder: ((context, index) => FreeGameBanner()),
              pageSnapping: true,
              onPageChanged: (position) {
                setState(() {
                  _dotPosition = position.toDouble();
                });
              },
            ),
          ),
          SizedBox(height: AppDimens.margin_medium_2x),
          DotsIndicator(
            dotsCount: 5,
            position: _dotPosition,
          ),
          SizedBox(height: AppDimens.margin_medium_2x),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppDimens.margin_medium_3x),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DiscountedGameRow();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DiscountedGameRow extends StatelessWidget {
   DiscountedGameRow({
    Key? key,
  }) : super(key: key);

  List<Color> colorList = [Color(0xffEBDFD1), Color(0xffA4C5B4), Color(0xffD4E2F6), Color(0xffDCDEFC)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.margin_medium),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimens.margin_medium_2x),
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          height: AppDimens.height_percentage_off_game_row,
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.margin_medium_2x),
                    child: Image.network(
                      'https://sm.ign.com/ign_in/blogroll/b/biomutant-/biomutant-complete-guide-to-special-editions-and-preorders_xubt.jpg',
                      fit: BoxFit.cover,
                      width: AppDimens.height_percentage_off_game_row,
                      height: AppDimens.height_percentage_off_game_row,
                    ),
                  ),
                  SizedBox(width: AppDimens.margin_medium),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio Mutant',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: AppFonts.poppins,
                            fontSize: AppDimens.text_regular_1x,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: AppDimens.margin_small),
                      Row(
                        children: [
                          Text(
                            '\$39.99',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                                fontFamily: AppFonts.poppins,
                                fontSize: AppDimens.text_regular_1x,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: AppDimens.margin_medium),
                          Text(
                            '\$19.99',
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: AppFonts.poppins,
                                fontSize: AppDimens.text_regular_1x,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.margin_medium),
                  child: GenreChip(genre: 'Adventure',color: colorList[Random.secure().nextInt(4)],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FreeGameBanner extends StatefulWidget {
  const FreeGameBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<FreeGameBanner> createState() => _FreeGameBannerState();
}

class _FreeGameBannerState extends State<FreeGameBanner> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppDimens.margin_medium_3x),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.margin_medium_2x),
              child: Image.network(
                'https://www.posterposse.com/wp-content/uploads/2018/06/God-Of-War-banner.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(AppDimens.margin_medium_2x),
                  bottomLeft: Radius.circular(AppDimens.margin_medium_2x)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white.withOpacity(0.2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppDimens.margin_medium),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'God Of War',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppFonts.poppins,
                                    fontSize: AppDimens.text_regular_1x,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: AppDimens.margin_small),
                              ReleaseYearChip(year: '2018'),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: AppDimens.margin_medium),
                          child: SlideCountdown(
                            duration: const Duration(days: 2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ReleaseYearChip extends StatelessWidget {
  final String year;
  ReleaseYearChip({required this.year});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.margin_small, horizontal: AppDimens.margin_medium_2x),
      decoration: BoxDecoration(
          color: AppColors.color_primary_dark,
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.margin_medium_3x))),
      child: Text(
        year,
        style: TextStyle(color: Colors.white, fontSize: AppDimens.text_small),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String genre;
  final Color color;
  GenreChip({required this.genre, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.margin_small, horizontal: AppDimens.margin_medium_2x),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.margin_medium_3x))),
      child: Text(
        genre,
        style: TextStyle(color: Colors.black45, fontSize: AppDimens.text_small),
      ),
    );
  }
}
