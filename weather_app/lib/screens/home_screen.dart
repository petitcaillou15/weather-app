import 'package:flutter/material.dart';
import '../data/card.dart';
import '../data/demo_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool farenheit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Météo'),
        backgroundColor: Color(0xFF87CEEB),
        leading: IconButton(
              icon: const Icon(Icons.thermostat),
              onPressed: () {
                setState(() {
                  farenheit = !farenheit;
                });
              }
            ),
        ),
      body: Column(
        children: [
          for (var demo in demoData)
            WeatherCard(
              title: demo.place.name,
              dayTemperature: demo.forecast.currentTemperature,
              weathrCode: demo.forecast.weatherCode,
              todayHours: demo.forecast.todayHours,
              nextDays: demo.forecast.nextDays,
              farenheit: farenheit,
            ),
        ],
      ),
    );
  }
}
