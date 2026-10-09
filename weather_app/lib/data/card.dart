import 'package:flutter/material.dart';
import '../models/forecast.dart';

class WeatherCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: DefaultTextStyle.of(context).style
                  .apply(fontSizeFactor: 2.0)
            ),
            Text(subtitle, style: DefaultTextStyle.of(context).style
                  .apply(fontSizeFactor: 1.3)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var hours in todayHours)
                    Column(
                      children: [
                        Text('${hours.hour}h'),
                        Text('${hours.temperature.round()}°'),
                      ],
                    ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var days in nextDays)
                  Column(
                    children: [
                      Text('${days.date.day}/${days.date.month}'),
                      Text('${days.temperature.round()}°'),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
