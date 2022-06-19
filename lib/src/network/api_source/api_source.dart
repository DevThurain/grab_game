
import 'package:dio/dio.dart';
import 'package:grab_games/src/network/api_constants.dart';
import 'package:grab_games/src/network/epic_api.dart';

class ApiSource {
  late Dio dio;
  late EpicAPI mApi;

  static final ApiSource _singleton = ApiSource.internal();

  factory ApiSource() {
    return _singleton;
  }

  ApiSource.internal(){
    dio = Dio();
    // Alice alice = locator<Alice>();
    // dio.options.connectTimeout = 10000;
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90));

    // dio.interceptors.add(alice.getDioInterceptor());
  }

  EpicAPI publicApi() {
    dio.options.headers = {
      "Content-Type": Headers.jsonContentType,
      "Accept": Headers.jsonContentType,
    };

    mApi = EpicAPI(dio);

    return mApi;
  }

  // EpicAPI privateApi() {
  //   late final SharedPreferenceHelper _pref = locator<SharedPreferenceHelper>();
  //   String token = _pref.getString(PREF_AUTH_TOKEN);
  //   print("token =>" + token);

  //   dio.options.headers = {
  //     "Content-Type": Headers.jsonContentType,
  //     "Accept": Headers.jsonContentType,
  //     "X-API-TOKEN": "ZBJ3MafcVGQvEdCYPfGT",
  //     "Authorization": "Bearer " + token
  //   };

  //   mApi = EpicAPI(dio);
  //   return mApi;
  // }
}
