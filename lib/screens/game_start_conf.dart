import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/screens/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Theme/theme.dart';
import '../Widgets/IntroScreenWidgets.dart';
import 'game_count_down.dart';
var totalQusetion;
var operation;
var keyType;
var difficulty;
bool isMixed=false;
String difficultyIs='Easy';

class GameStartConfo extends StatefulWidget {
  const GameStartConfo({super.key});


  @override
  State<GameStartConfo> createState() => _GameStartConfoState();
}

class _GameStartConfoState extends State<GameStartConfo> {
  bool _isClicked = false;

  void startGame(){
    Get.off(
      const GameStarterTimer(),
      arguments: {
        'totalQuestion': totalQusetion,
        'operation': operation,
        'keyType':keyType,
        'difficulty': difficulty,
        'difficultyIs': difficultyIs,
      },
    );
  }

  void settingPageRed(){
    Get.to(const SettingsPage(),
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 500))?.then((value) => subtractionFun());
  }

  Future<void> subtractionFun() async {
    pref = await SharedPreferences.getInstance();
    int? tQues = pref?.getInt('tot_ques');
    if (tQues == null){
      pref?.setInt('tot_ques', 10);
    }else{
      totalQusetion=tQues;
    }

    int? ketType = pref?.getInt('key_type');
    if (ketType == null){
      pref?.setInt('key_type', 1);
    }else{
      keyType=ketType;
    }

    int? hardness = pref?.getInt('hardness_level');
    if (hardness == null){
      pref?.setInt('hardness_level', 1);
    }else{
      difficulty=hardness;
    }

    if(difficulty==1){
      difficultyIs = 'Easy';
    }else if(difficulty==2){
      difficultyIs = 'Medium';
    }else{
      difficultyIs = 'Hard';
    }

    operation = Get.arguments as String;
    if(operation=='Arithmetic'){
      isMixed=true;
    }else{
      isMixed=false;
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
      backgroundColor: HexColor(ThemesOfProject().background),
      appBar: AppBar(
        centerTitle: true,
        title: Text('In-Mind $operation',
        // title: Text('In-Mind Addition',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: HexColor(ThemesOfProject().square_colors),
          ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  HexColor(ThemesOfProject().background),
                  HexColor(ThemesOfProject().primary_colors),
                ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )
          ),
        ),
      ),

      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: Get.height*0.15,),
                  GestureDetector(
                    child: beautifulLottieCard(
                      widthIs: Get.width*0.7,
                      heightIs: Get.width*0.5,
                      cardColor: ThemesOfProject().secondary_colors,
                      cardShadingColor: _isClicked? ThemesOfProject().background:'#6363bf',
                      lottieAsset: 'assets/confPlayGameLottie.json',),

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
                  SizedBox(height: Get.height*0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
                        child : GestureDetector(
                          onTap: () {
                            settingPageRed();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.black, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#6363bf'),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                )
                              ],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0)),
                              color: HexColor('#071185'),
                            ),
                            child: Center(
                                child: Text(
                                  'Total Question: $totalQusetion',
                                  style: const TextStyle(
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
                        child: GestureDetector(
                          onTap: () {
                            settingPageRed();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.black, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#6363bf'),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                )
                              ],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0)),
                              color: HexColor('#071185'),
                            ),
                            child: Center(
                                child: Text(
                                  'Hardness: $difficultyIs',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(height: Get.height*0.1),
                ],
              ),
              SizedBox(
                width: Get.width*0.8,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  startGame();
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#a10838'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ), child: const Text('START', style: TextStyle(color: Colors.white, fontSize: 25)),),
              ),

            ],
        ),
      ),
    );
  }
}
