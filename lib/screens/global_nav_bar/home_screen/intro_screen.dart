import 'dart:core';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/shared/background.dart';
import '../../../Data/quotes.dart';
import '../../../shared/alertBox.dart';
import '../../../shared/app_bar.dart';
import '../../../shared/theme.dart';
import '../setting_screen/setting_screen.dart';
import 'game_screens/game_start_conf.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String quoteOfTheDay = '';
  final appAsset = Get.find<AppAssets>();

  @override
  void initState() {
    super.initState();
    quoteOfTheDay = Quotes().randomQuotes();
  }

  void settingFun() {
    Get.to(const SettingsPage(),
        curve: Curves.linear,
        duration: const Duration(seconds: 1)
    );
  }

  void additionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Addition',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  void subtractionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Subtraction',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  void multiplicationFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Multiply',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  void divisionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Division',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  void squareRootFun() {
    Get.to(const GameStartConfo(),
        arguments: 'SquareRoot',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  void mixedFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Arithmetic',
        // curve: Curves.linear,
        // duration: const Duration(seconds: 1)
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => MyAppAlertBox.showExitConfirmationDialog(
          context: context,
          Title: 'Confirm Exit',
          Body:
          'Are you sure you want to exit this game?',
          FunYesButton: () {
            SystemNavigator.pop();
          }
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CommonUsedWidget.background(
          child: Stack(
            children: [
              const AppBarCustom(
                title: '',
                isCenter: false,
                showSettingIcon: false,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SlideInRight(
                      //   duration: const Duration(milliseconds: 600),
                      //   child: heading_and_subtitle_top(),
                      // ),
                      // FadeInUp(
                      //   duration: const Duration(milliseconds: 800),
                      //   delay: const Duration(milliseconds: 300),
                      //   child: CustomCoursalSclider(),
                      // ),
                      // ElasticInLeft(
                      //   duration: const Duration(milliseconds: 1000),
                      //   delay: const Duration(milliseconds: 600),
                      //   child: types(),
                      // ),
                      // ZoomIn(
                      //   duration: const Duration(milliseconds: 800),
                      //   delay: const Duration(milliseconds: 900),
                      //   child: grid_view_items(),
                      // ),


                      // FadeInDown(
                      //   duration: const Duration(milliseconds: 700),
                      //   curve: Curves.easeOutCubic,
                      //   child: heading_and_subtitle_top(),
                      // ),
                      // BounceInUp(
                      //   duration: const Duration(milliseconds: 900),
                      //   delay: const Duration(milliseconds: 400),
                      //   curve: Curves.elasticOut,
                      //   child: CustomCoursalSclider(),
                      // ),
                      // FlipInX(
                      //   duration: const Duration(milliseconds: 800),
                      //   delay: const Duration(milliseconds: 700),
                      //   curve: Curves.decelerate,
                      //   child: types(),
                      // ),
                      // ElasticInRight(
                      //   duration: const Duration(milliseconds: 1500),
                      //   delay: const Duration(milliseconds: 1000),
                      //   curve: Curves.easeOutExpo,
                      //   child: grid_view_items(),
                      // ),

                      FadeInDown(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutCubic,
                        child: heading_and_subtitle_top(),
                      ),
                      BounceInUp(
                        duration: const Duration(milliseconds: 900),
                        delay: const Duration(milliseconds: 400),
                        curve: Curves.elasticOut,
                        child: CustomCoursalSclider(),
                      ),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 700),
                        delay: const Duration(milliseconds: 600),
                        curve: Curves.decelerate,
                        child: types(),
                      ),
                      FadeInRightBig(
                        duration: const Duration(milliseconds: 900),
                        delay: const Duration(milliseconds: 1000),
                        curve: Curves.bounceOut,
                        child: grid_view_items(),
                      ),
                      // ... Other widgets
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heading_and_subtitle_top() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Mathmatica Mind',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: ColorOfApp.textBold,
                fontFamily: 'Oswald'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Mathematical Skills',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              fontFamily: 'OpenSans',
              color: ColorOfApp.textLight,
            ),
          ),
        )
      ],
    );
  }

  Widget CustomCoursalSclider() {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Transform.scale(
              scale: 2, child: Lottie.asset(appAsset.lottieHelloAi)),
        ));
  }

  Widget types() {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 45),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Quote Of The Day',
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: ColorOfApp.textBold,
                fontFamily: 'Oswald',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AutoSizeText(
              quoteOfTheDay,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'OpenSans',
                color: ColorOfApp.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget grid_view_items() {
    Widget buildImage(String imagePath) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Lottie.asset(imagePath),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10.0,
          childAspectRatio: 16 / 7,
          crossAxisSpacing: 25.0,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          final topics = [
            {
              'name': 'Addition',
              'image': appAsset.lottieAiHome,
              'onTap': additionFun
            },
            {
              'name': 'Subtraction',
              'image': appAsset.lottieBrain,
              'onTap': subtractionFun
            },
            {
              'name': 'Multiplication',
              'image': appAsset.lottieOnboardBrain,
              'onTap': multiplicationFun
            },
            {
              'name': 'Division',
              'image': appAsset.lottieOnboardMasterMath,
              'onTap': divisionFun
            },
            {
              'name': 'Square Root',
              'image': appAsset.lottiePlayGame,
              'onTap': squareRootFun
            },
            {
              'name': 'Mixed',
              'image': appAsset.lottieSetting,
              'onTap': mixedFun
            },
          ];

          bool isEven = index % 2 == 0;

          return GestureDetector(
            onTap: topics[index]['onTap'] as void Function(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: ColorOfApp.card.withOpacity(0.9),
                shadowColor: ColorOfApp.cardShadow,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (!isEven) ...[
                        buildImage(topics[index]['image'] as String),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              topics[index]['name'] as String,
                              style: const TextStyle(
                                  fontSize: 24, color: ColorOfApp.textBold),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Improve your ${topics[index]['name']} skills with practice',
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(color: ColorOfApp.textLight),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      if (isEven) ...[
                        const SizedBox(width: 10),
                        buildImage(topics[index]['image'] as String),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
