import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_home_bloc.dart';
import 'package:weather_app/model/forcast.dart';
import 'package:weather_app/utils/data.dart';
import 'package:weather_app/view/widget/error_message.dart';
import 'package:weather_app/view/widget/weather_brief.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: Consumer<WeatherHomeBloc>(
        builder: (context, bloc, child) {
          // Case of no data
          if (bloc.forecast == null) {
            // Fetch forecast data
            bloc.fetchForecast();
            return Center(
              child: CircularProgressIndicator(),
            );
            // Case of success data fetching
          } else if (bloc.forecast.state == DataState.Success) {
            Forecast forecast = bloc.forecast.data;

            return WeatherBrief(
                city: forecast.city.name,
                temperature: bloc.selectedDay.main.temp.toInt(),
                daysAfter: bloc.daysAfter,
                description: bloc.selectedDay.weather.description,
                weatherState: bloc
                    .checkWeatherState(forecast.list[0].weather.main)
                    .toString(),
                date: DateTime.fromMillisecondsSinceEpoch(
                    bloc.selectedDay.dt * 1000));
          }
          // Case of error
          return ErrorMessage(message: bloc.forecast.message);
        },
      ),
    ));
  }
}
