import 'dart:convert';

import 'package:weather_app/model/forcast.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/utils/data.dart';

class WeatherRepo {
  final _apiService = ApiService();

  final _forecastEndPoint =
      'forecast?id=292223&appid=4343555b136db241cb08c95659de76cb';

  Future<Data<Forecast>> fetchForecast() async {
    final response = await _apiService.request(
        requestType: RequestType.GET, endPoint: _forecastEndPoint);
    final json = jsonDecode(response);
    return Data<Forecast>.success(Forecast.fromJson(json));
    try {} catch (e) {
      Data.handleException(e);
    }
  }
}
