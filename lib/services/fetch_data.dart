import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:airqualitymonitor/services/sensor_data.dart';

Future<SensorData> fetchSensorData() async {
  final response = await http.get(Uri.parse("http://127.0.0.1:3000/fetchData"));
  // print(response.body);
  if (response.statusCode == 200) {
    return SensorData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to Fetch Data");
  }
}
