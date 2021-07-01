import 'package:flutter/material.dart';

class WeatherSymbol extends StatelessWidget {
  final String _weatherState;

  const WeatherSymbol({@required String weatherState, Key key})
      : _weatherState = weatherState ?? 'sunny',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // Show weather symbol based on weather state
        child: Image.asset(
          'asset/image/weather_symbol/$_weatherState.png',
          fit: BoxFit.contain,
          alignment: Alignment.center,
          width: 300.0,
        ),
      ),
    );
  }
}
