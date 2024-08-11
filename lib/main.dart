import 'package:flicker_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlickerApp());
}

class FlickerApp extends StatefulWidget {
  const FlickerApp({super.key});

  @override
  State<FlickerApp> createState() => _FlickerAppState();
}

class _FlickerAppState extends State<FlickerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
