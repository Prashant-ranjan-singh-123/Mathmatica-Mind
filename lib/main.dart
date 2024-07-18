import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/screens/splash_screen/splash_screen.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(12,5,77,1),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const IntroScreen(),
      home: const SplashScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Poppins',fontSize: 20.0, fontWeight: FontWeight.w600),
          )
      ),
    );
  }
}
