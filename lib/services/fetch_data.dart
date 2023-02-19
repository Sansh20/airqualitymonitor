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

Future<Map<int, SensorData>> fetchHistoricalData() async {
  final response =
      await http.get(Uri.parse("http://127.0.0.1:3000/fetchHistData"));
  DateTime today = DateTime.now();
  var histDataMap = <int, SensorData>{};
  if (response.statusCode == 200) {
    var histData = jsonDecode(response.body);
    for (String i in histData.keys) {
      Map<String, dynamic> tmp = {i: histData[i]};
      histDataMap[today.difference(DateTime.parse(i)).inDays] =
          SensorData.fromJson(tmp);
    }
    return histDataMap;
  } else {
    throw Exception("Failed to Fetch Data");
  }
}
