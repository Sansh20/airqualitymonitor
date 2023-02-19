import 'package:airqualitymonitor/services/sensor_data.dart';
import 'package:airqualitymonitor/widgets/details_comp.dart';
import 'package:flutter/material.dart';
import 'package:airqualitymonitor/theme/gruv_colors.dart';
import 'dart:html';

class AirQualityComponent extends StatefulWidget {
  final SensorData sensorData;
  final Function reloadOnPressed;
  final Function histDataOnPressed;

  const AirQualityComponent(
      {super.key,
      required this.sensorData,
      required this.reloadOnPressed(),
      required this.histDataOnPressed()});

  @override
  State<AirQualityComponent> createState() => _AirQualityComponentState();
}

class _AirQualityComponentState extends State<AirQualityComponent> {
  late SensorData sensorData = widget.sensorData;
  double height = 0,
      width = 0,
      countOfColums = 0,
      aspectRatio = 3.0,
      addValH = 0,
      addValW = 0;
  // Map<String, List<>>generateValues()

  Map<String, List<dynamic>> detailsMap = {};
  List<String> mapKeysInOrder = [
    "Temp",
    "Humidity",
    "At. Pressure",
    "C0",
    "PPM",
  ];

  @override
  initState() {
    super.initState();
    detailsMap["Temp"] = [sensorData.temp, "°C"];
    detailsMap["Humidity"] = [sensorData.humidity, ""];
    detailsMap["C0"] = [sensorData.co, ""];
    detailsMap["PPM"] = [sensorData.ppm, ""];
    detailsMap["At. Pressure"] = [sensorData.pressure, ""];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool tinyWindow = size.height < window.screen!.height! - 100;

    if (size.height > size.width || tinyWindow) {
      height = (tinyWindow) ? size.height / 1.6 : size.height / 3.8;
      width = size.width - 30;
      countOfColums = 3;
      aspectRatio = 1 / 0.6;
      // aspectRatio = 1;
      addValH = -10;
      addValW = 0;
    } else {
      height = size.height / 4.0;
      width = size.width - 30;
      countOfColums = 5;
      aspectRatio = 1;
      addValH = 0;
      addValW = 250;
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 14, 4),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              GruvColors.colorMap[sensorData.getRange()]!
            ],
            begin: Alignment.bottomLeft,
            end: const Alignment(0.25, -0.7),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(80),
              spreadRadius: 0.6,
              blurRadius: 8,
              offset: const Offset(0.0, 7.0),
            )
          ]),
      height: height,
      width: width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: GruvColors.black)),
              child: Row(
                children: [
                  const Icon(
                    Icons.fmd_good,
                    size: 20,
                  ),
                  Text(
                    sensorData.location,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            // const Padding(padding: EdgeInsets.only(top: 4)),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: GruvColors.black)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: GruvColors.black)),
                    width: 320 + addValW,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: countOfColums.ceil(),
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: aspectRatio,
                      children: List.generate(
                        mapKeysInOrder.length,
                        (index) {
                          return Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: GruvColors.black)),
                            child: DetailComponent(
                              magnitude: detailsMap[mapKeysInOrder[index]]![0],
                              title: mapKeysInOrder[index],
                              magStyle: Theme.of(context).textTheme.headline6!,
                              titleStyle:
                                  Theme.of(context).textTheme.headline3!,
                              sideText: detailsMap[mapKeysInOrder[index]]![1],
                              sideTextStyle:
                                  Theme.of(context).textTheme.headline5!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 115,
                    width: 150,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: GruvColors.black)),
                    child: DetailComponent(
                      magnitude: sensorData.aqi,
                      title: classes[sensorData.getRange().index],
                      magStyle: Theme.of(context).textTheme.headline2!,
                      titleStyle: Theme.of(context).textTheme.labelMedium!,
                      sideText: "aqi",
                      sideTextStyle: Theme.of(context).textTheme.headline5!,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: GruvColors.black)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.reloadOnPressed();
                    },
                    // style: const ButtonStyle(
                    //     splashFactory: NoSplash.splashFactory),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.refresh,
                          size: 18,
                          color: GruvColors.black,
                        ),
                        Text(
                          " Data From ${sensorData.getLocalDateTime()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.histDataOnPressed();
                    },
                    // style: const ButtonStyle(
                    //     splashFactory: NoSplash.splashFactory),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Click for Historical Data",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 12),
                        ),
                        const Icon(
                          Icons.expand_more_sharp,
                          size: 22,
                          color: GruvColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
