import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/shared/theme.dart';

class CommonUsedWidget {
  static Widget background({required child, bool isBottomNav = false}) {
    return AuraBox(
        spots: [
          AuraSpot(
            color: ColorOfApp.backgroundBubble,
            radius: 400.0,
            alignment: const Alignment(0.7,-0.7),
            blurRadius: 0,
            stops: const [0, 0.9],
          ),
          AuraSpot(
            color: ColorOfApp.backgroundBubble,
            radius: 400.0,
            alignment: const Alignment(-0.7,0.7),
            blurRadius: 0,
            stops: const [0, 0.9],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: isBottomNav? Container(
          height: 20,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorOfApp.background.withOpacity(0.9),
                ColorOfApp.background.withOpacity(0.9),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: child,
        )
            :
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorOfApp.background.withOpacity(0.9),
                ColorOfApp.background.withOpacity(0.9),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: child,
        )
    );
  }
}