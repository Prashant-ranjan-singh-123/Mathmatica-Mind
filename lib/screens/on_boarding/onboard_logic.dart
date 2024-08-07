import 'package:flutter/material.dart';
import 'package:mathmatics_mind/Data/app_strings.dart';
import 'package:mathmatics_mind/shared/background.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import '../../Data/app_assets.dart';
import '../../shared/theme.dart';
import '../global_nav_bar/global_nav_bar.dart';
import 'onboard_display_page.dart';

class OnboardLogic extends StatefulWidget {
  OnboardLogic({super.key});

  @override
  State<OnboardLogic> createState() => _OnboardLogicState();
}

class _OnboardLogicState extends State<OnboardLogic> {
  bool isLast = false;

  bool isFirst = true;

  final appAssets = Get.find<AppAssets>();

  final appStrings = Get.find<AppStrings>();

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    List pages;
    pages = [
      OnboardDisplayPage(
        heading: appStrings.OnBoardHeading1,
        body: appStrings.OnBoardBody1,
        lottie: appAssets.lottieScoreBoard,
      ),
      OnboardDisplayPage(
        heading: appStrings.OnBoardHeading2,
        body: appStrings.OnBoardBody2,
        lottie: appAssets.lottieOnboardBrain,
      ),
      OnboardDisplayPage(
        heading: appStrings.OnBoardHeading3,
        body: appStrings.OnBoardBody3,
        lottie: appAssets.lottieOnboardMasterMath,
      ),
      OnboardDisplayPage(
        heading: appStrings.OnBoardHeading4,
        body: appStrings.OnBoardBody4,
        lottie: appAssets.lottiePlayGame,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: ColorOfApp.cardShadow.withOpacity(0.8),
        toolbarHeight: 15,
      ),
      body: CommonUsedWidget.background(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                onPageChanged: (int val) {
                  if (val == 0) {
                    isLast = false;
                    isFirst = true;
                  }
                  if (val == 3) {
                    isLast = true;
                    isFirst = false;
                  }
                  if (val != 3 && val != 0) {
                    isLast = false;
                    isFirst = false;
                  }
                  setState(() {
                    isLast;
                    isFirst;
                  });
                },
                controller: controller,
                children: List.generate(pages.length, (index) => pages[index]),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.93),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!isFirst)
                    InkWell(
                        onTap: () {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorOfApp.bottomNavCard,
                          child: Icon(
                            Icons.navigate_before,
                            color: Colors.black,
                          ),
                        ))
                  else
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                    ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                        dotColor: ColorOfApp.textBold,
                        // expansionFactor: 6,
                        activeDotColor: ColorOfApp.backgroundBubble,
                        dotWidth: 7,
                        dotHeight: 7),
                  ),
                  if (!isLast)
                    InkWell(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorOfApp.bottomNavCard,
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ))
                  else
                    InkWell(
                        onTap: () {
                          Get.off(const GlobalNavBar(),
                              transition: Transition.zoom,
                              duration: const Duration(milliseconds: 450));
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorOfApp.bottomNavCard,
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

