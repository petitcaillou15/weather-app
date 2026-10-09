class HourlyTemperature {
  final int hour;
  final double temperature;

  const HourlyTemperature({required this.hour, required this.temperature});
}

class DailyMean {
  final DateTime date;
  final double temperature;

  const DailyMean({required this.date, required this.temperature});
}

class Forecast {
  final double currentTemperature;
  final int weatherCode;
  final List<HourlyTemperature> todayHours;
  final List<DailyMean> nextDays;

  const Forecast({
    required this.currentTemperature,
    required this.weatherCode,
    required this.todayHours,
    required this.nextDays,
  });
}
