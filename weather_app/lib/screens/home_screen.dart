import 'package:flutter/material.dart';
import '../data/card.dart';
import '../data/demo_data.dart';
import '../weather_code.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    debugPrint('demoData: ${demoData.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Météo'),
        backgroundColor: Color(0xFF87CEEB),
      ),
      body: Column(
        children: [
          for (var demo in demoData)
            WeatherCard(
              title: demo.place.name,
              subtitle: '${demo.forecast.currentTemperature}°C · ${describeWeather(demo.forecast.weatherCode)}',
              todayHours: demo.forecast.todayHours,
              nextDays: demo.forecast.nextDays,
            ),
        ],
      )
      );
  }

}