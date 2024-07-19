import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_start_conf.dart';

class GameScreenLogic{
  static void additionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Addition',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  static void subtractionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Subtraction',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  static void multiplicationFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Multiply',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  static void divisionFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Division',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  static void squareRootFun() {
    Get.to(const GameStartConfo(),
        arguments: 'SquareRoot',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  static void mixedFun() {
    Get.to(const GameStartConfo(),
        arguments: 'Arithmetic',
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }
}