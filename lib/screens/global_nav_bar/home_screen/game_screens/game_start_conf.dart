import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/shared/background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../shared/IntroScreenWidgets.dart';
import '../../../../shared/app_bar.dart';
import '../../../../shared/theme.dart';
import '../../setting_screen/setting_screen.dart';
import 'game_count_down.dart';

var totalQusetion;
var operation;
var keyType;
var difficulty;
bool isMixed = false;
String difficultyIs = 'Easy';

class GameStartConfo extends StatefulWidget {
  const GameStartConfo({super.key});

  @override
  State<GameStartConfo> createState() => _GameStartConfoState();
}

class _GameStartConfoState extends State<GameStartConfo> {
  bool _isClicked = false;
  final appAssets = Get.find<AppAssets>();

  void startGame() {
    Get.off(
      const GameStarterTimer(),
      arguments: {
        'totalQuestion': totalQusetion,
        'operation': operation,
        'keyType': keyType,
        'difficulty': difficulty,
        'difficultyIs': difficultyIs,
      },
    );
  }

  void settingPageRed() {
    Get.to(const SettingsPage(),
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 500))
        ?.then((value) => subtractionFun());
  }

  Future<void> subtractionFun() async {
    pref = await SharedPreferences.getInstance();
    int? tQues = pref?.getInt('tot_ques');
    if (tQues == null) {
      pref?.setInt('tot_ques', 10);
    } else {
      totalQusetion = tQues;
    }

    int? ketType = pref?.getInt('key_type');
    if (ketType == null) {
      pref?.setInt('key_type', 1);
    } else {
      keyType = ketType;
    }

    int? hardness = pref?.getInt('hardness_level');
    if (hardness == null) {
      pref?.setInt('hardness_level', 1);
    } else {
      difficulty = hardness;
    }

    if (difficulty == 1) {
      difficultyIs = 'Easy';
    } else if (difficulty == 2) {
      difficultyIs = 'Medium';
    } else {
      difficultyIs = 'Hard';
    }

    operation = Get.arguments as String;
    if (operation == 'Arithmetic') {
      isMixed = true;
    } else {
      isMixed = false;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subtractionFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonUsedWidget.background(
        child: _buildStructure(),
      ),
    );
  }

  Widget _buildStructure() {
    return Stack(
      children: [
        const AppBarCustom(
          title: '',
          isCenter: false,
          showSettingIcon: false,
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGameType(),
                  // SizedBox(),
                  const SizedBox(),
                  // const SizedBox(height: 20),
                  _buildLottieCard(),
                  // const SizedBox(height: 20),
                  _buildGameStartInfo(),
                  // const SizedBox(height: 20),
                  _buildStartGameButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGameType() {
    return Text(
      'In-Mind $operation',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w800,
        fontSize: 25,
        color: HexColor('#a3a2ba'),
      ),
    );
  }

  Widget _buildLottieCard() {
    return GestureDetector(
      child: beautifulLottieCard(
        widthIs: Get.width * 0.7,
        heightIs: Get.width * 0.5,
        cardColor: ColorOfApp.card,
        cardShadingColor: _isClicked? Colors.transparent : ColorOfApp.cardShadow.withOpacity(0.4),
        lottieAsset: appAssets.lottiePlayGame,
      ),
      onTapDown: (_) => setState(() => _isClicked = true),
      onTapUp: (_) => setState(() => _isClicked = false),
      onTapCancel: () => setState(() => _isClicked = false),
    );
  }

  Widget _buildGameStartInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: const SizedBox()),
        _buildInfoContainer('Total Question: $totalQusetion'),
        Expanded(child: const SizedBox()),
        _buildInfoContainer('Difficulty: $difficultyIs'),
        Expanded(child: const SizedBox())
      ],
    );
  }

  Widget _buildInfoContainer(String text) {
    return GestureDetector(
      onTap: () {
        settingPageRed();
      },
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow.withOpacity(0.5),
        elevation: 10,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Oswald',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStartGameButton() {
    return SizedBox(
      width: Get.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          startGame();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorOfApp.backgroundBubble,
          elevation: 25,
          shadowColor: ColorOfApp.cardShadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text('START',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
