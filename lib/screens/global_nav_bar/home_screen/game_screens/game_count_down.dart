import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/home_screen/game_screens/real_game.dart';
import 'package:mathmatics_mind/shared/background.dart';

import '../../../../shared/theme.dart';

class GameStarterTimer extends StatefulWidget {
  const GameStarterTimer({super.key});

  @override
  State<GameStarterTimer> createState() => _GameStarterTimerState();
}

class _GameStarterTimerState extends State<GameStarterTimer> {
  bool _shouldNavigate = true;
  var totalQusetion;
  var operation;
  var keyType;
  var difficulty;
  String difficultyIs='Easy';
  final appAssets = Get.find<AppAssets>();

  void nxtPage() {
    if (_shouldNavigate) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(()=> const RealGame(),
          arguments: {
            'totalQuestion': totalQusetion,
            'operation': operation,
            'keyType':keyType,
            'difficulty': difficulty,
            'difficultyIs': difficultyIs,
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    totalQusetion = args['totalQuestion'];
    keyType = args['keyType'];
    operation = args['operation'];
    difficulty = args['difficulty'];
    difficultyIs = args['difficultyIs'];
    nxtPage();
  }

  @override
  void dispose() {
    _shouldNavigate = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonUsedWidget.background(
        child: Center(
          child: Lottie.asset(appAssets.lottieTimer, repeat: false),
        ),
      ),
    );
  }
}
