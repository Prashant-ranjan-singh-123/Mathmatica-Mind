import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/screens/on_boarding/style_on_boarding_page.dart';
import '../../shared/app_bar.dart';
import '../../shared/theme.dart';

class OnboardDisplayPage extends StatelessWidget {
  String heading;
  String body;
  String lottie;
  OnboardDisplayPage(
      {super.key,
      required this.heading,
      required this.body,
      required this.lottie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(ThemesOfProject().background),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.95,
                  height: Get.height * 0.63,
                  child: Lottie.asset(lottie,
                      reverse: true),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: HexColor(ThemesOfProject().secondary_colors),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 20, left: 20),
                    child: Column(
                      children: [
                        Text(heading,
                            style: TextStyleIs().heading(context)),
                        const SizedBox(height: 15),
                        Text(
                          body,
                          style: TextStyleIs().subtitle(context),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ))
                // Image.asset('assets/brain_sides_onboarding.png', height: Get.height*0.35, width: Get.height*0.35,),
              ],
            ),
            const AppBarCustom(
                title: '', isCenter: true, showSettingIcon: false),
          ],
        ));
  }
}
