import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_colors.dart';
import 'package:grab_games/src/constants/app_dimens.dart';

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
