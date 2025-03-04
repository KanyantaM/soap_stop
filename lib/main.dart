import 'package:flutter/material.dart';
import 'package:soap_stop/app/nav.dart';
import 'package:soap_stop/app/theme.dart';

void main() {
  runApp(const SoapStopApp());
}

class SoapStopApp extends StatelessWidget {
  const SoapStopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soap Stop',
      theme: SoapStopTheme.lightTheme,
      // darkTheme: SoapStopTheme.darkTheme,
      // themeMode: ThemeMode.system,
      home: const App(),
    );
  }
}
