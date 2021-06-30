import 'package:flutter/material.dart';
import 'package:weather_app/view/widget/weather_symbol.dart';

class WeatherBrief extends StatelessWidget {
  final String _weatherDescription = 'It\'s raining now';
  const WeatherBrief({Key key}) : super(key: key);

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
        ],
      ),
    );
  }
}
