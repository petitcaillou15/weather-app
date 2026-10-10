import 'package:flutter/material.dart';
import '../models/forecast.dart';

class WeatherCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<HourlyTemperature> todayHours;
  final List<DailyMean> nextDays;

  const WeatherCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.todayHours,
    required this.nextDays,
  });
  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  bool _showWeek = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: DefaultTextStyle.of(context).style
                  .apply(fontSizeFactor: 2.0)
            ),
            Text(widget.subtitle, style: DefaultTextStyle.of(context).style
                  .apply(fontSizeFactor: 1.3)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var hours in widget.todayHours)
                    Column(
                      children: [
                        Text('${hours.hour}h'),
                        Text('${hours.temperature.round()}°'),
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
                        Text('${day.temperature.round()}°'),
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
