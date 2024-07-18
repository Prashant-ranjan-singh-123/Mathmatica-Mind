import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/screens/setting_screen.dart';
import '../Data/quotes.dart';
import '../shared/IntroScreenWidgets.dart';
import '../shared/app_bar.dart';
import '../shared/theme.dart';
import 'game_start_conf.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String quoteOfTheDay = '';
  bool _isClicked = false;

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
      body: Stack(
        children: [
          const AppBarCustom(
              title: 'Mathematica Mind',
              isCenter: false,
              showSettingIcon: true,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  GestureDetector(
                    child: beautifulLottieCardIntro(
                      widthIs: MediaQuery.of(context).size.width*0.65,
                      heightIs: MediaQuery.of(context).size.width*0.4,
                      cardColor: ThemesOfProject().secondary_colors,
                      cardShadingColor: _isClicked? ThemesOfProject().background : '#a3a2ba',
                      lottieAsset: 'assets/Brain.json',),
                    onTapDown: (_) {
                      setState(() {
                        _isClicked = true;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        _isClicked = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _isClicked = false;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  PlayerReadingText(
                    headLine: 'Hello Gamer,',
                    subtitle: 'Quote of the day',
                    quote: quoteOfTheDay,
                  ),

                  const Center(
                    child: Text(
                      'Choose any one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        decorationColor: Colors.lightGreenAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  // Game Cards
                  Column(
                    children: [
                      GameCard(
                        heading: 'Addition',
                        icon1: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => additionFun(),
                        heading2: 'Subtraction',
                        onTap2: () => subtractionFun(),
                        icon2: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GameCard(
                        heading: 'Multiply',
                        icon1: const Text(
                          'x',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          ),
                        ),
                        // icon1: FaIcon(FontAwesomeIcons.arith),
                        onTap: () => multiplicationFun(),
                        heading2: 'Divide',
                        icon2: const Text(
                          '÷',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          ),
                        ),
                        onTap2: () => divisionFun(),
                      ),
                      GameCard(
                        heading: 'SquareRoot',
                        icon1: const Text(
                          '√a',
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => squareRootFun(),
                        heading2: 'Mixed',
                        icon2: const Text(
                          '+-X÷',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        onTap2: () => mixedFun(),
                      ),
                    ],
                  ),
                  // ... Other widgets
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: HexColor(ThemesOfProject().background),
    );
  }
}
