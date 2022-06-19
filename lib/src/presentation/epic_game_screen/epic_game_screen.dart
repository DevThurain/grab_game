import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/presentation/epic_game_screen/widgets/discount_game_row.dart';
import 'package:grab_games/src/presentation/epic_game_screen/widgets/free_game_banner.dart';

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
          /* Free Game Banner Section */
          SizedBox(
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
          /* Discount Game Section */
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DiscountGameRow();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


