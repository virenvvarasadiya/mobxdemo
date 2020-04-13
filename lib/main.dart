import 'package:flutter/material.dart';
import 'package:mobxdemo/cricket/cricket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeCricket()
        /*  home: Provider(
        create: (_) => WeatherStore(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),*/
        );
  }
}
