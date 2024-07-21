import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/screens/on_boarding/style_on_boarding_page.dart';
import 'package:mathmatics_mind/shared/background.dart';
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
        backgroundColor: Colors.black,
        body: CommonUsedWidget.background(
          child: myStack(
            children: [
              lottie_anim(),
              displayText()
            ],
          ),
        ));
  }

  Widget myStack({required List<Widget> children}){
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children
        ),
        const AppBarCustom(
            title: '', isCenter: true, showSettingIcon: false)
      ],
    );
  }

  Widget lottie_anim(){
    return Column(
      children: [
        SizedBox(
          width: Get.width * 0.95,
          height: Get.height * 0.63,
          child: ElasticIn(
            duration: const Duration(seconds: 1),
            child: Lottie.asset(lottie,
                reverse: true),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        )
      ],
    );
  }

  Widget displayText(){
    Widget buildDragHandle() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: ColorOfApp.bottomSheetHandle,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
      );
    }

    return Expanded(
        child: FadeInUp(
          // delay: const Duration(milliseconds: 400),
          duration: const Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(
              color: ColorOfApp.backgroundBubble.withOpacity(0.8),
              gradient: LinearGradient(colors: [
                ColorOfApp.backgroundBubble.withOpacity(0.5),
                Colors.transparent
              ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Column(
                children: [
                  buildDragHandle(),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.decelerate,
                    child: AutoSizeText(heading,
                        maxLines: 1,
                        style: TextStyleIs().heading()),
                  ),
                  const SizedBox(height: 15),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1300),
                    child: AutoSizeText(
                      body,
                      maxLines: 3,
                      style: TextStyleIs().subtitle(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
