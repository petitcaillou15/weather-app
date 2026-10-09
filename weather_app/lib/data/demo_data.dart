import '../models/forecast.dart';
import '../models/place.dart';

class PlaceForecast {
  final Place place;
  final Forecast forecast;
  const PlaceForecast(this.place, this.forecast);
}

final demoData = [
  PlaceForecast(
    const Place(name: 'Saint-Étienne', latitude: 45.43, longitude: 4.39),
    Forecast(
      currentTemperature: 18.5,
      weatherCode: 61,
      todayHours: const [
        HourlyTemperature(hour: 8, temperature: 15.5),
        HourlyTemperature(hour: 12, temperature: 17.2),
        HourlyTemperature(hour: 18, temperature: 19.0),
        HourlyTemperature(hour: 20, temperature: 17.3),
      ],
      // 7 upcoming days, starting tomorrow
      nextDays: List.generate(
        7,
        (i) => DailyMean(
          date: DateTime.now().add(Duration(days: i + 1)),
          temperature: 10.0 + i,
        ),
      ),
    ),
  ),
  PlaceForecast(
    const Place(name: 'Gennevilliers', latitude: 48.93, longitude: 2.3),
    Forecast(
      currentTemperature: 15.5,
      weatherCode: 56,
      todayHours: const [
        HourlyTemperature(hour: 9, temperature: 15),
        HourlyTemperature(hour: 13, temperature: 18.2),
        HourlyTemperature(hour: 15, temperature: 29.0),
        HourlyTemperature(hour: 21, temperature: 16.3),
      ],
      // 7 upcoming days, starting tomorrow
      nextDays: List.generate(
        7,
        (i) => DailyMean(
          date: DateTime.now().add(Duration(days: i + 1)),
          temperature: 10.0 + i,
        ),
      ),
    ),
  ),
  PlaceForecast(
    const Place(name: 'Lyon', latitude: 45.75, longitude: 4.85),
    Forecast(
      currentTemperature: 20.5,
      weatherCode: 67 ,
      todayHours: const [
        HourlyTemperature(hour: 8, temperature: 12.5),
        HourlyTemperature(hour: 12, temperature: 19.2),
        HourlyTemperature(hour: 18, temperature: 30.0),
        HourlyTemperature(hour: 20, temperature: 12.3),
      ],
      // 7 upcoming days, starting tomorrow
      nextDays: List.generate(
        7,
        (i) => DailyMean(
          date: DateTime.now().add(Duration(days: i + 1)),
          temperature: 10.0 + i,
        ),
      ),
    ),
  ),
];
