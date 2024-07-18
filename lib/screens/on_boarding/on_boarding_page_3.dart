import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/screens/on_boarding/style_on_boarding_page.dart';

import '../../shared/app_bar.dart';
import '../../shared/theme.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/master_math_onboard.json';
    return Scaffold(
        backgroundColor: HexColor(ThemesOfProject().background),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Get.width*0.95,
                  height: Get.height*0.63,
                  child: Lottie.asset(imagePath),
                ),
                SizedBox(height: Get.height*0.01,),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor(ThemesOfProject().secondary_colors),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                        child: Column(
                          children: [
                            Text('Master Maths', style: TextStyleIs().heading(context)),
                            const SizedBox(height: 15),
                            Text(
                              "Conquer addition, subtraction, multiplication, division, square roots, and more! Our progressive difficulty levels keep you challenged and motivated as you become a math whiz.",
                              style: TextStyleIs().subtitle(context),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    )
                )
                // Image.asset('assets/brain_sides_onboarding.png', height: Get.height*0.35, width: Get.height*0.35,),
              ],
            ),
            const AppBarCustom(title: '',
                isCenter: true,
                showSettingIcon: false),
          ],
        )
    );
  }
}
