import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grab_games/src/constants/locator.dart';
import 'package:grab_games/src/presentation/epic_game_screen/bloc/epic_game_bloc.dart';

import 'src/app.dart';

void main() async {
  debugRepaintRainbowEnabled = false;

  await setupLocator();
  runApp(MyApp());
}
