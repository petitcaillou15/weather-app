import 'package:flutter/material.dart';
import 'package:weather_app/weather_code.dart';
import '../models/forecast.dart';

class WeatherCard extends StatefulWidget {
  final String title;
  final double dayTemperature;
  final int weathrCode;
  final List<HourlyTemperature> todayHours;
  final List<DailyMean> nextDays;
  final bool farenheit;

  const WeatherCard({
    super.key,
    required this.title,
    required this.dayTemperature,
    required this.weathrCode,
    required this.todayHours,
    required this.nextDays,
    required this.farenheit
  });
  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  bool _showWeek = false;
  bool farenheit = false;

  double toFarenheit(double celcius){
    return celcius*(9/5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    farenheit = widget.farenheit;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: DefaultTextStyle.of(context).style
                  .apply(fontSizeFactor: 1.5)
            ),
            Text(farenheit ? '${toFarenheit(widget.dayTemperature).round()}F · ${describeWeather(widget.weathrCode)}' :
              '${widget.dayTemperature.round()}° · ${describeWeather(widget.weathrCode)}'),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var hours in widget.todayHours)
                    Column(
                      children: [
                        Text('${hours.hour}h'),
                        Text(farenheit ? '${toFarenheit(hours.temperature).round()}F' :'${hours.temperature.round()}°'),
                      ],
                    ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _showWeek = !_showWeek),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_showWeek ? 'Masquer la semaine' : 'Voir la semaine'),
                  ],
                ),
              ),
            ),
            if (_showWeek) ...[
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var day in widget.nextDays)
                    Column(
                      children: [
                        Text('${day.date.day}/${day.date.month}'),
                        Text(farenheit ? '${toFarenheit(day.temperature).round()}F' : '${day.temperature.round()}°')
                      ],
                    ),
                ],
              ),
            ]  
          ],
        ),
      ),
    );
  }
}
