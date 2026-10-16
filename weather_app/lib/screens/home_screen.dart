import 'package:flutter/material.dart';
import 'package:weather_app/models/place.dart';
import '../data/card.dart';
import '../data/demo_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool farenheit = false;
  List<Place> listplace = listPlace; 

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
      body: SingleChildScrollView(
        child: Column( 
          children: [
          for (var place in listplace)
            WeatherCard(
              title: place.name,
              forecast: fakeForcast(),
              farenheit: farenheit,
            ),
        ],
      ),
      )
    );
  }
}
