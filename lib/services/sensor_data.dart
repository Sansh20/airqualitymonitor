import 'package:intl/intl.dart';

import '../theme/gruv_colors.dart';

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

  String getLocalDateTime() {
    var localTime = time.toLocal();
    String formattedDate = DateFormat('dd MMM hh:mm a').format(localTime);
    var day = localTime.day;
    String suffix = _getDateSuffix(day);
    formattedDate = formattedDate.replaceFirst(day.toString(), "$day$suffix");
    return formattedDate;
  }

  String _getDateSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  AQIColorEnum getRange() {
    if (aqi < 51) {
      return AQIColorEnum.GOOD;
    } else if (aqi < 101) {
      return AQIColorEnum.MOD;
    } else if (aqi < 151) {
      return AQIColorEnum.UHS;
    } else if (aqi < 201) {
      return AQIColorEnum.UHLTHY;
    } else if (aqi < 301) {
      return AQIColorEnum.VUHLTHY;
    } else {
      return AQIColorEnum.HAZ;
    }
  }
}
