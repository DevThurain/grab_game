import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_dimens.dart';

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
