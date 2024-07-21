import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/Data/app_strings.dart';
import 'package:mathmatics_mind/shared/background.dart';
import '../../Data/app_assets.dart';
import '../../check_first_time.dart';
import '../../shared/global_var_and_fun.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appAssets = Get.find<AppAssets>();
  final appString = Get.find<AppStrings>();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3500), (){
      Get.off(const CheckFirstTime());
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonUsedWidget.background(
        child: myCustomColumn(children: [
          Lottie.asset(appAssets.lottieHello, repeat: false)
        ]),
      ),
    );
  }
  Widget myCustomColumn({required List<Widget> children}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      width: returnSizeOfScreenWhichIsSmaller() * 0.4,
      height: returnSizeOfScreenWhichIsSmaller() * 0.4,
      child: Image.asset(appAssets.appImage),
    );
  }

  Widget nameOfApp() {
    return const Column(
      children: [
        SizedBox(height: 25),
        AutoSizeText(
          'Mathmatica Mind',
          maxLines: 1,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget shortDescription() {
    return const AutoSizeText(
      '---All you need---',
      maxLines: 1,
      style: TextStyle(fontFamily: 'OpenSans', color: Colors.white),
    );
  }
}
