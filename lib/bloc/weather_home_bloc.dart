import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/forcast.dart';
import 'package:weather_app/model/list_item.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/utils/data.dart';

class WeatherHomeBloc extends ChangeNotifier {
  final WeatherRepo _weatherRepo = WeatherRepo();
  Data<Forecast> forecast;

  List<ListItem> _weatherForDaysAfter;

  void fetchForecast() async {
    forecast = await _weatherRepo.fetchForecast();
    getWeathersForDaysAfter();
    notifyListeners();
  }

  // Group weather forecast by days
  void getWeathersForDaysAfter() {
    if (forecast.state != DataState.Success) return;

    _weatherForDaysAfter = [];
    for (int i = 0; i < forecast.data.list.length; i += 8) {
      _weatherForDaysAfter.add(forecast.data.list[i]);
    }
  }

  // Check weather state
  String checkWeatherState(String state) {
    switch (state) {
      case 'Clear':
        return 'sunny';
        break;
      case 'Sunny':
        return 'sunny';
        break;
      case 'Rain':
        return 'rain';
      case 'Cloudy':
        return 'cloudy';
      default:
        return 'sunny';
    }
  }

  get daysAfter => _weatherForDaysAfter;
}
