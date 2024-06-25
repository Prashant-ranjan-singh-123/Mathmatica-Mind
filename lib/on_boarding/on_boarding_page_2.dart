import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/on_boarding/style_on_boarding_page.dart';

import '../Theme/theme.dart';
import '../Widgets/app_bar.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/brain_onboard.json';
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
                            Text('Train Your Brain', style: TextStyleIs().heading(context)),
                            const SizedBox(height: 15),
                            Text(
                              "This isn't your ordinary math class. We make learning fun and engaging with interactive games that challenge your mind and boost your cognitive abilities.",
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
