import 'package:get_it/get_it.dart';
import 'package:grab_games/src/presentation/epic_game_screen/bloc/epic_game_bloc.dart';

GetIt locator = GetIt.instance;

Future setupLocator()async{
    locator
      .registerFactory(() => EpicGameBloc());
}
