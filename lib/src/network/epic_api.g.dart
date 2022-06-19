// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epic_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EpicAPI implements EpicAPI {
  _EpicAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://store-site-backend-static-ipv4.ak.epicgames.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EpicGameData> getEpicGameData(locale, country, allowCountries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'locale': locale,
      r'country': country,
      r'allowCountries': allowCountries
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EpicGameData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/freeGamesPromotions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EpicGameData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
