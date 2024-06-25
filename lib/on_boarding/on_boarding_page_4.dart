import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/on_boarding/style_on_boarding_page.dart';
import 'package:get/get.dart';

import '../Theme/theme.dart';
import '../Widgets/app_bar.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/confPlayGameLottie.json';
    return Scaffold(
        backgroundColor: HexColor(ThemesOfProject().background),
        body: Stack(
          children: [
            const AppBarCustom(title: '',
                isCenter: true,
                showSettingIcon: false),
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
                            Text('Start Your Journey', style: TextStyleIs().heading(context)),
                            const SizedBox(height: 15),
                            Text(
                              "Let's unlock your mental math potential! Create your profile and get ready to tackle exciting challenges that will transform the way you think.",
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
          ],
        )
    );
  }
}
