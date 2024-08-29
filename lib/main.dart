import 'package:flutter/material.dart';

import 'DeviceSettingsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(
            200, 0, 4, 108),
        hintColor: Color.fromARGB(
            200, 0, 4, 108),
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          bodyMedium:
          TextStyle(color: Colors.black87, fontFamily: 'Montserrat'),
        ),
      ),
      home: DeviceSettingsScreen(),
    );
  }
}
