import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/list_item.dart';
import 'package:weather_app/utils/date_time_util.dart';
import 'package:weather_app/view/widget/weather_day_card.dart';
import 'package:weather_app/view/widget/weather_symbol.dart';

class WeatherBrief extends StatelessWidget {
  final String _weatherState;
  final String _weatherDescription;
  final String _city;
  final int _temperature;
  final List<ListItem> _daysAfter;
  final DateTime _date;

  const WeatherBrief(
      {String city,
      int temperature,
      List<ListItem> daysAfter,
      String description,
      String weatherState,
      DateTime date,
      Key key})
      : _city = city ?? 'City',
        _temperature = temperature ?? 0,
        _weatherDescription = description ?? 'It\'s raining now',
        _daysAfter = daysAfter,
        _weatherState = weatherState,
        _date = date,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade600,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 24),
                    child: Text(
                      _weatherDescription,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(right: 24),
                      alignment: Alignment.topRight,
                      child: Text(DateTimeUtils.formatDate(_date)),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherSymbol(
                  weatherState: _weatherState,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _city,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _temperature.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2)),
                          width: 10,
                          height: 10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WeatherDayCard(
                    dayForecast: _daysAfter[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 18,
                  );
                },
                itemCount: _daysAfter.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
