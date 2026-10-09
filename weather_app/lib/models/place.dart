/// A named location for which we display the weather.
class Place {
  // Class fields
  // final in this case: they never change after the object is created
  final String name;
  final double latitude;
  final double longitude;
  /// Constructor: parameters with `required` must be provided
  const Place({
  required this.name,
  required this.latitude,
  required this.longitude,
  });
}

