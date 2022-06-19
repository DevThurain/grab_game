import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grab_games/src/network/api_source/api_source.dart';
import 'package:grab_games/src/network/error/app_error.dart';
import 'package:grab_games/src/models/epic_game_data.dart';
import 'package:dartz/dartz.dart';
import 'package:grab_games/src/network/error/error_mapper.dart';
import 'package:grab_games/src/network/repository/repository.dart';

class RepositoryImpl implements Repositroy {
  late ApiSource _mSource;

  static final RepositoryImpl _singleton = RepositoryImpl.internal();

  factory RepositoryImpl() {
    return _singleton;
  }

  RepositoryImpl.internal() {
    _mSource = ApiSource();
  }
  @override
  Future<Either<AppError, EpicGameData>> getEpicGameData() async {
    try {
      //final response = await _mSource.publicApi().getHomeData();
      var data = await _mSource.publicApi().getEpicGameData('en-US', 'MM', 'MM');
      return Right(data);
    } on DioError catch (e) {
      return Left(ErrorMapper.mapDioToAppError(e));
    } on JsonUnsupportedObjectError catch (_) {
      return Left(AppError(errorCode: 0, message: "Respond is not Json"));
    } on TypeError catch (_) {
      return Left(AppError(errorCode: 0, message: "Invalid Json Type"));
    }
  }
}
