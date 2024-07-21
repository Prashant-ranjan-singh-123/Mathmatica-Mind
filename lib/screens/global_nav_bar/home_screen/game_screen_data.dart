import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/home_screen/game_screens/game_screen_logic.dart';

import '../../../shared/theme.dart';

class GameScreenData{
  static Widget customCard({required List<dynamic> experience}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              ColorOfApp.projectCursorSliderGradientTop,
              ColorOfApp.projectCursorSliderGradientDown
            ], // adjust colors as needed
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SizedBox(
            height: Get.height * 0.2,
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(experience[0],
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 23,
                            color: ColorOfApp.projectCursorSliderTextBold,
                            fontFamily: 'Merriweather',
                          )),
                      Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                              child: Text(
                                experience[1],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: ColorOfApp.projectCursorSliderTextLight,
                                  fontFamily: 'Merriweather',
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorOfApp.background,
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            experience[3]();
                          },
                          child: const Text(
                            '     Know More    ',
                            style: TextStyle(color: ColorOfApp.textBold),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    experience[2],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}