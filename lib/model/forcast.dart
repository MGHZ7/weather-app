import 'package:weather_app/model/list_item.dart';

class Forecast {
  int cod;
  String message;
  int cnt;
  List<ListItem> list;

  Forecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];

    if (json['list'] != null) {
      for (int i = 0; i < json['list'].length; i++) {
        list.add(ListItem.formJson(json['list'][i]));
      }
    }
  }
}
