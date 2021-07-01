import 'package:flutter/material.dart';
import 'package:weather_app/model/list_item.dart';
import 'package:weather_app/utils/date_time_util.dart';

class WeatherDayCard extends StatelessWidget {
  final ListItem _dayForecast;
  const WeatherDayCard({@required ListItem dayForecast, Key key})
      : _dayForecast = dayForecast,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(_dayForecast.weather.main),
          SizedBox(
            height: 24,
          ),
          Text(_dayForecast.weather.description),
          SizedBox(
            height: 24,
          ),
          Text(DateTimeUtils.formatDate(
              DateTime.fromMillisecondsSinceEpoch(_dayForecast.dt)))
        ],
      ),
    );
  }
}
