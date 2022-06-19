part of 'epic_game_bloc.dart';

@immutable
abstract class EpicGameState {}

class EpicGameInitialState extends EpicGameState {}

class EpicGameLoadingState extends EpicGameState {}

class EpicGameSuccessState extends EpicGameState {
  final EpicGameData epicGameData;
  EpicGameSuccessState({required this.epicGameData});
}

class EpicGameSuccessBannerState extends EpicGameState {
  final List<FreeGameVO> freeGameList;
  EpicGameSuccessBannerState({required this.freeGameList});
}

class EpicGameErrorState extends EpicGameState {
  final AppError appError;
  EpicGameErrorState({required this.appError});
}
