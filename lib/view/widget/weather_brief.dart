import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/widget/weather_symbol.dart';

class WeatherBrief extends StatelessWidget {
  final String _weatherDescription = 'It\'s raining now';
  final String _city;
  final int _temperature;

  const WeatherBrief({String city, int temperature, Key key})
      : _city = city ?? 'City',
        _temperature = temperature ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      color: Colors.amber.shade600,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  _weatherDescription,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Flexible(flex: 2, child: Container())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherSymbol(
                weatherState: 'raining',
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
                    style: Theme.of(context).textTheme.headline5,
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
          Row(
            children: [
              ListView(
                scrollDirection: Axis.horizontal,
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}
