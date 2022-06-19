import 'package:dartz/dartz.dart';
import 'package:grab_games/src/models/epic_game_data.dart';
import 'package:grab_games/src/network/error/app_error.dart';

abstract class Repositroy {
  Future<Either<AppError, EpicGameData>> getEpicGameData();
}
