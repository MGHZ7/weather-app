import 'package:weather_app/model/list_item.dart';

import 'city.dart';

class Forecast {
  String cod;
  int message;
  int cnt;
  List<ListItem> list;
  City city;

  Forecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    city = City.fromJson(json['city']);

    if (json['list'] != null) {
      list = [];
      for (int i = 0; i < json['list'].length; i++) {
        list.add(ListItem.formJson(json['list'][i]));
      }
    }
  }
}
