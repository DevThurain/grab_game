import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/constants/locator.dart';
import 'package:grab_games/src/presentation/epic_game_screen/bloc/epic_game_bloc.dart';
import 'package:grab_games/src/presentation/epic_game_screen/widgets/discount_game_row.dart';
import 'package:grab_games/src/presentation/epic_game_screen/widgets/free_game_banner.dart';

class EpicGameScreen extends StatefulWidget {
  const EpicGameScreen({Key? key}) : super(key: key);

  @override
  State<EpicGameScreen> createState() => _EpicGameScreenState();
}

class _EpicGameScreenState extends State<EpicGameScreen> {
  double _dotPosition = 0.0;
  late EpicGameBloc epicGameBloc;

  @override
  void initState() {
    epicGameBloc = locator<EpicGameBloc>();
    epicGameBloc.add(GetEpicGame());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: AppDimens.margin_medium_3x),
          /* Free Game Banner Section */
          BlocBuilder<EpicGameBloc, EpicGameState>(
            bloc: epicGameBloc,
            builder: (context, state) {
              if (state is EpicGameSuccessBannerState) {
                return SizedBox(
                  width: double.infinity,
                  height: AppDimens.height_free_game_banner,
                  child: PageView.builder(
                    itemCount: state.freeGameList.length,
                    itemBuilder: ((context, index) => FreeGameBanner(freeGameVO: state.freeGameList[index],)),
                    pageSnapping: true,
                    onPageChanged: (position) {
                      setState(() {
                        _dotPosition = position.toDouble();
                      });
                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            },
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
