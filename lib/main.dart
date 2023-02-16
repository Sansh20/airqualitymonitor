import 'package:flutter/material.dart';
import 'package:airqualitymonitor/theme/main_theme.dart';
import 'package:airqualitymonitor/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Quality Monitor',
      theme: MainTheme.theme,
      initialRoute: '/',
      // routes: {

      // },
      home: Home(),
    );
  }
}
