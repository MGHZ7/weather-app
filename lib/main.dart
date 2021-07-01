import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_home_bloc.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/view/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeGenerator().generateTheme(Theme.of(context)),
      home: ChangeNotifierProvider(
          create: (context) => WeatherHomeBloc(), child: Home()),
    );
  }
}
