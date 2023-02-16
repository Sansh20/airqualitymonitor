class SensorData {
  final DateTime time;
  final double aqi;
  final double co;
  final double temp;
  final double humidity;
  final double ppm;
  final double pressure;
  final String location;

  const SensorData({
    required this.time,
    required this.aqi,
    required this.co,
    required this.temp,
    required this.humidity,
    required this.ppm,
    required this.pressure,
    required this.location,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    String key = json.keys.first;
    Map<String, dynamic> sensorData = json[key];
    return SensorData(
      time: DateTime.parse(key),
      aqi: sensorData['aqi'],
      co: sensorData['co'],
      temp: sensorData['temp'],
      humidity: sensorData['humidity'],
      ppm: sensorData['ppm'],
      pressure: sensorData['pressure'],
      location: sensorData['location'],
    );
  }
}
