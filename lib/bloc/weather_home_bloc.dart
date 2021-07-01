import 'package:flutter/cupertino.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/utils/data.dart';

class WeatherHomeBloc extends ChangeNotifier {
  final WeatherRepo _weatherRepo = WeatherRepo();
  Data forecast;

  void fetchForecast() async {
    forecast = await _weatherRepo.fetchForecast();
    notifyListeners();
  }
}
