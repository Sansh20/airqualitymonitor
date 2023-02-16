import 'package:airqualitymonitor/services/fetch_data.dart';
import 'package:airqualitymonitor/services/sensor_data.dart';
import 'package:flutter/material.dart';
import 'package:airqualitymonitor/widgets/air_quality_comp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Air Quality Monitor"),
        titleTextStyle: Theme.of(context).textTheme.headline1,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchSensorData(),
          builder: (BuildContext context, AsyncSnapshot<SensorData> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  AirQualityComponent(sensorData: snapshot.data!),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text("Failed to Load Data");
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
