import 'package:flutter/material.dart';
import 'package:weather_app/model/list_item.dart';

class WeatherDayCard extends StatelessWidget {
  final ListItem _dayForecast;
  const WeatherDayCard({@required ListItem dayForecast, Key key})
      : _dayForecast = dayForecast,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
    );
  }
}
