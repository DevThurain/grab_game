import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grab_games/src/models/epic_game_data.dart';
import 'package:grab_games/src/models/free_game_vo.dart';
import 'package:grab_games/src/network/error/app_error.dart';
import 'package:grab_games/src/network/repository/repository_impl.dart';
import 'package:meta/meta.dart';

part 'epic_game_event.dart';
part 'epic_game_state.dart';

class EpicGameBloc extends Bloc<EpicGameEvent, EpicGameState> {
  var repositoryImpl = RepositoryImpl();

  EpicGameBloc() : super(EpicGameInitialState()) {
    on<GetEpicGame>((event, emit) async {
      emit(EpicGameLoadingState());
      print('fetching ...');

      Either<AppError, EpicGameData> response = await repositoryImpl.getEpicGameData();
      response.fold((l) {
        emit(EpicGameErrorState(appError: l));
        print('error ... ${l.message}');
      }, (r) {
        emit(EpicGameSuccessState(epicGameData: r));
        print('success ...');

        List<FreeGameVO> freegameList = [];
        r.data.catalog.searchStore.elements.forEach((it) {
          print(it.effectiveDate);
          if (it.promotions?.promotionalOffers?.isNotEmpty == true) {
              Duration diff =
              it.promotions?.promotionalOffers?.first?.promotionalOffers.first.endDate.difference(DateTime.now()) ??
                  Duration();
          print(diff.toString());
          freegameList.add(FreeGameVO(
              name: it.title, releaseYear: '', imageUrl: it.keyImages.first.url, timeRemaining: diff, isActive: ''));
          }
        
        });
        emit(EpicGameSuccessBannerState(freeGameList: freegameList));
      });
    });
  }
}
