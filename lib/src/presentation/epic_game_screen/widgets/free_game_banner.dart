import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/constants/app_fonts.dart';
import 'package:grab_games/src/models/free_game_vo.dart';
import 'package:grab_games/src/presentation/global/release_year_chip.dart';
import 'package:slide_countdown/slide_countdown.dart';

class FreeGameBanner extends StatefulWidget {
  final FreeGameVO freeGameVO;

  FreeGameBanner({required this.freeGameVO});

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
                widget.freeGameVO.imageUrl,
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.freeGameVO.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFonts.poppins,
                                      fontSize: AppDimens.text_regular_1x,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(height: AppDimens.margin_small),
                              // ReleaseYearChip(year: '2018'),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: AppDimens.margin_medium),
                          child: SlideCountdown(
                            duration: widget.freeGameVO.timeRemaining,
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
