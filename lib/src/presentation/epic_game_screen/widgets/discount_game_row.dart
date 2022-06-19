import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/constants/app_fonts.dart';
import 'package:grab_games/src/presentation/global/genere_chip.dart';

class DiscountGameRow extends StatelessWidget {
   DiscountGameRow({
    Key? key,
  }) : super(key: key);

  final List<Color> colorList = [Color(0xffEBDFD1), Color(0xffA4C5B4), Color(0xffD4E2F6), Color(0xffDCDEFC)];

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

