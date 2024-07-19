import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/home_screen/game_screen_data.dart';
import 'package:mathmatics_mind/shared/background.dart';

import '../../../Data/quotes.dart';
import '../../../shared/IntroScreenWidgets.dart';
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
  bool _isClicked = false;
  final appAsset = Get.find<AppAssets>();

  @override
  void initState() {
    super.initState();
    quoteOfTheDay = Quotes().randomQuotes();
  }

  void settingFun(){
    Get.to(const SettingsPage(),
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void additionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Addition',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void subtractionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Subtraction',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void multiplicationFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Multiply',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void divisionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Division',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void squareRootFun() {
    Get.to(const GameStartConfo(),
        arguments: 'SquareRoot',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  void mixedFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Arithmetic',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    heading_and_subtitle_top(),
                    CustomCoursalSclider(),
                    types(),
                    grid_view_items(),
                    // ... Other widgets
                  ],
                ),
              ),
            ),
          ],
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
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CarouselSlider(
        items: GameScreenData.cursol_slider_item,
        options: CarouselOptions(
          aspectRatio: 16 / 7,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (page, _) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget types() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AutoSizeText(
              'Quote Of The Day',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: ColorOfApp.textBold,
                fontFamily: 'Oswald',
              ),
            ),
            const SizedBox(height: 15,),
            AutoSizeText(
              quoteOfTheDay,
              maxLines: 2,
              textAlign: TextAlign.center,
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
    Widget first_item(int index) {
      return GestureDetector(
        onTap: () {
        },
        child: Column(
          children: [
            Card(
              color: ColorOfApp.card,
              elevation: 50,
              shadowColor: ColorOfApp.cardShadow,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/feature_graphic/addition.png',
                    fit: BoxFit.contain,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: AutoSizeText('Addition',
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: ColorOfApp.textBold,
                      fontFamily: 'Poppins')),
            )
          ],
        ),
      );
    }

    Widget rest_item(int index) {
      return GestureDetector(
        onTap: () {
        },
        child: Column(
          children: [
            Card(
              color: ColorOfApp.textBold,
              elevation: 50,
              shadowColor: ColorOfApp.cardShadow,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/feature_graphic/addition.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: AutoSizeText(
                        'Addition',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                            color: ColorOfApp.textBold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget build_grid_view(int index) {
      if (index == 0) {
        return first_item(index);
      } else {
        return rest_item(index);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 25.0, // spacing between columns
        ),
        itemBuilder: (context, index) {
          return build_grid_view(index);
        },
        itemCount: 5+1,
        // itemCount: 1, // Number of items you want to display
      ),
    );
  }
}
