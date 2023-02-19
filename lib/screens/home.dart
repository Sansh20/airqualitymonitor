import 'package:airqualitymonitor/services/fetch_data.dart';
import 'package:airqualitymonitor/services/sensor_data.dart';
import 'package:flutter/material.dart';
import 'package:airqualitymonitor/widgets/air_quality_comp.dart';

// import '../widgets/historical_data_comp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<SensorData> sensorData;
  bool showHistData = true;
  void initState() {
    super.initState();
    sensorData = fetchSensorData();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 15)),
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // if (showHistData)
                //   Positioned(
                //     top: 194,
                //     child: FutureBuilder(
                //       future: fetchHistoricalData(),
                //       builder: ((context, snapshot) {
                //         if (snapshot.connectionState == ConnectionState.done) {
                //           if (snapshot.hasData) {
                //             return HistoricalDataComponent(
                //               histData: snapshot.data!,
                //             );
                //           } else if (snapshot.hasError) {
                //             return const Text("Failed to Load Data");
                //           }
                //         }
                //         return const CircularProgressIndicator();
                //       }),
                //     ),
                //   ),
                FutureBuilder(
                  future: sensorData,
                  builder: (BuildContext context,
                      AsyncSnapshot<SensorData> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return AirQualityComponent(
                          sensorData: snapshot.data!,
                          reloadOnPressed: () {
                            setState(() {
                              sensorData = fetchSensorData();
                            });
                          },
                          histDataOnPressed: () {
                            setState(
                              () {
                                showHistData = !showHistData;
                              },
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Text("Failed to Load Data");
                      }
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
