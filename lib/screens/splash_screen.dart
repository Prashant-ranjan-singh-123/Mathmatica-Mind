import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Theme/theme.dart';
import '../check_first_time.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), (){
      Get.off(const CheckFirstTime(),transition: Transition.fade, duration: const Duration(milliseconds: 500));
    });
    return Scaffold(
      backgroundColor: HexColor('#071185'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 40,
              shadowColor: Colors.white,
              color: HexColor('#071185'),
              child: SizedBox(
                  width: 200, height: 200, child: Image.asset('assets/icon.png')),
            ),
          ),
          const SizedBox(height: 50,),
          const Text('Mathmatica Mind', style: TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w800,
            fontSize: 35,
            color: Colors.white),
          ),
        ],
      ),
    );
  }
}
