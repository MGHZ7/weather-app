import 'package:flutter/material.dart';
import 'package:weather_app/config/theme.dart';
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
      home: Home(),
    );
  }
}
