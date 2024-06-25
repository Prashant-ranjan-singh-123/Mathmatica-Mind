import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/screens/splash_screen.dart';

import 'Theme/theme.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(12,5,77,1),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const IntroScreen(),
      home: const SplashScreen(),
      // home: const RealGame(),
      // home: const SettingsPage(),
      // home: const GameStartConfo(),
      // home: const GameStarterTimer(),
      theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Poppins',fontSize: 20.0, fontWeight: FontWeight.w600),
          )
      ),
    );
  }
}
