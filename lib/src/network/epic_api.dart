import 'package:dio/dio.dart';
import 'package:grab_games/src/models/epic_game_data.dart';
import 'package:grab_games/src/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'epic_api.g.dart';

@RestApi(baseUrl: ApiConstant.epicGameBasedUrl)
abstract class EpicAPI {
  factory EpicAPI(Dio dio) = _EpicAPI;

  @GET("/freeGamesPromotions")
  Future<EpicGameData> getEpicGameData(
    @Query('locale') String? locale,
    @Query('country') String? country,
    @Query('allowCountries') String? allowCountries,
  );
}
