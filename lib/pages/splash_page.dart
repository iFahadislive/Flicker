import 'dart:async';
import 'dart:convert';
import 'package:flicker_app/models/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../generated/assets.dart';
import 'home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      await _setUp(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  Future<void> _setUp(BuildContext context) async {
    final getIt = GetIt.instance;

    final  configFile = (await rootBundle.load(Assets.configMain));
    final configString = utf8.decode(configFile.buffer.asUint8List());
    final configData = jsonDecode(configString );

    getIt.registerSingleton<AppConfig>(AppConfig(
        apiKey: configData["API_Key"],
        baseURL: configData["Base_URL"],
        baseImageURL: configData["Base_Image_URL"]
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.black12,
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7,
                colorFilter:
                ColorFilter.mode(Colors.black54, BlendMode.overlay)),
          ),
          child: Image.asset('assets/images/splash.gif'),
        ),
      ),
    );
  }
}
