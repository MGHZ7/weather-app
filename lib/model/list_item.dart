import 'package:weather_app/model/main.dart';
import 'package:weather_app/model/weather.dart';

class ListItem {
  int dt;
  Main main;
  Weather weather;

  ListItem.formJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather = Weather.fromJson(json['weather']);
  }
}
