import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/screens/game_start_conf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/IntroScreenWidgets.dart';
import '../shared/app_bar.dart';
import '../shared/theme.dart';

class GameResult extends StatefulWidget {
  const GameResult({super.key});

  @override
  State<GameResult> createState() => _GameResultState();
}

class _GameResultState extends State<GameResult> {
  var totalQusetion;
  var difficulty;
  var seconds;
  var Timer;
  bool isLoading = true;
  bool _isClicked = false;
  late double avg_time;
  late List<int> Scores;

  // Shared Pref Name:-
  //
  // Addition_10_easy,
  // Addition_10_medium,
  // Addition_10_hard,
  // Addition_20_easy,
  // Addition_20_medium,
  // Addition_20_hard,
  // Addition_30_easy,
  // Addition_30_medium,
  // Addition_30_hard,
  // Addition_40_easy,
  // Addition_40_medium,
  // Addition_40_hard,
  //
  //
  // Subtraction_10_easy,
  // Subtraction_10_medium,
  // Subtraction_10_hard,
  // Subtraction_20_easy,
  // Subtraction_20_medium,
  // Subtraction_20_hard,
  // Subtraction_30_easy,
  // Subtraction_30_medium,
  // Subtraction_30_hard,
  // Subtraction_40_easy,
  // Subtraction_40_medium,
  // Subtraction_40_hard,
  //
  //
  // Multiply_10_easy,
  // Multiply_10_medium,
  // Multiply_10_hard,
  // Multiply_20_easy,
  // Multiply_20_medium,
  // Multiply_20_hard,
  // Multiply_30_easy,
  // Multiply_30_medium,
  // Multiply_30_hard,
  // Multiply_40_easy,
  // Multiply_40_medium,
  // Multiply_40_hard,
  //
  //
  // Division_10_easy,
  // Division_10_medium,
  // Division_10_hard,
  // Division_20_easy,
  // Division_20_medium,
  // Division_20_hard,
  // Division_30_easy,
  // Division_30_medium,
  // Division_30_hard,
  // Division_40_easy,
  // Division_40_medium,
  // Division_40_hard,
  //
  //
  // SquareRoot_10_easy,
  // SquareRoot_10_medium,
  // SquareRoot_10_hard,
  // SquareRoot_20_easy,
  // SquareRoot_20_medium,
  // SquareRoot_20_hard,
  // SquareRoot_30_easy,
  // SquareRoot_30_medium,
  // SquareRoot_30_hard,
  // SquareRoot_40_easy,
  // SquareRoot_40_medium,
  // SquareRoot_40_hard,
  //
  //
  // Arithmetic_10_easy,
  // Arithmetic_10_medium,
  // Arithmetic_10_hard,
  // Arithmetic_20_easy,
  // Arithmetic_20_medium,
  // Arithmetic_20_hard,
  // Arithmetic_30_easy,
  // Arithmetic_30_medium,
  // Arithmetic_30_hard,
  // Arithmetic_40_easy,
  // Arithmetic_40_medium,
  // Arithmetic_40_hard,

  String timeInStandard(int _seconds) {
    if (_seconds < 10) {
      return '00:0$_seconds';
    } else if (_seconds >= 10 && _seconds < 60) {
      return '00:$_seconds';
    } else if (_seconds >= 3600) {
      // 3600 seconds = 1 hour
      return 'Too Long';
    } else {
      int minutes = _seconds ~/ 60;
      int remainingSeconds = _seconds % 60;
      String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
      String secondsStr =
          (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';
      return '$minutesStr:$secondsStr';
    }
  }

  void setScore(List<int> stringArray, int seconds) {
    int highest = -1;
    int highestIndex = -1;
    int indexOf100 = -1;
    bool is100 = false;
    bool isAdd = false;
    while (stringArray.length < 10) {
      stringArray.add(-100);
    }
    for (int i = 0; i < stringArray.length; ++i) {
      if (stringArray[i] != -100 && highest < stringArray[i]) {
        highest = stringArray[i];
        highestIndex = i;
      }
      if (stringArray[i] == -100) {
        is100 = true;
        indexOf100 = i;
      }
      if (stringArray[i] == -100 || seconds < stringArray[i]) {
        isAdd = true;
      }
    }
    if (is100) {
      stringArray[indexOf100] = seconds;
    } else {
      if (isAdd) {
        stringArray[highestIndex] = seconds;
      }
    }
    stringArray.sort();
    stringArray = stringArray.where((element) => element != -100).toList();
    while (stringArray.length > 10) {
      stringArray.removeLast();
    }
    Scores = stringArray;
  }

  Future<void> saveStringArray(List<int> array, SharedPrefName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(array);
    await prefs.setString(SharedPrefName, jsonString);
  }

  Future<List<int>> loadStringArray(SharedPrefName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(SharedPrefName);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.cast<int>();
    }
    return [];
  }

  setSharedPref() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });
    String nameOfSharedPref = '${operation}_${totalQusetion}_${difficultyIs}';
    List<int> stringArray = await loadStringArray(nameOfSharedPref);
    if (stringArray.isEmpty) {
      List<int> newMap = [seconds];
      Scores = newMap;
      await saveStringArray(newMap, nameOfSharedPref);
    } else {
      setScore(stringArray, seconds);
      await saveStringArray(Scores!, nameOfSharedPref);
    }
    setState(() {
      isLoading = false; // Hide loading indicator
    });
    print('Score is: $Scores');
    print('Score length: ${Scores.length}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    totalQusetion = args['totalQusetion'];
    seconds = args['seconds'];
    Timer = args['Timer'];
    operation = args['operation'];
    difficulty = args['difficulty'];
    avg_time = seconds / totalQusetion;
    avg_time = double.parse(avg_time.toStringAsFixed(2));
    if(isMixed){
      operation = 'Mixed';
    }
    setSharedPref();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(ThemesOfProject().background),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    '$operation',
                    style: const TextStyle(
                      fontFamily: 'Oswald',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  GestureDetector(
                    child: beautifulLottieCard(
                      widthIs: MediaQuery.of(context).size.width * 0.8,
                      heightIs: MediaQuery.of(context).size.width * 0.5,
                      cardColor: ThemesOfProject().secondary_colors,
                      cardShadingColor: _isClicked
                          ? ThemesOfProject().background
                          : '#a3a2ba',
                      lottieAsset: 'assets/scoreboard_anim.json',
                    ),
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
                  SizedBox(height: Get.height * 0.1),
                  const Text(
                    'Game Details',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
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
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
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
                                style: const TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
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
                                // 'isMixed: $isMixed',
                                'Time: $Timer',
                                style: const TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 6,
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
                                'Average: $avg_time',
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.05),
                  const Text(
                    'Scores',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            containerGrid(
                              10,
                              0,
                              0,
                              0,
                              Colors.black,
                              HexColor(ThemesOfProject().secondary_colors),
                              Colors.white,
                              'Position',
                            ),
                            containerGrid(
                              0,
                              0,
                              0,
                              0,
                              Colors.black,
                              HexColor(ThemesOfProject().secondary_colors),
                              Colors.white,
                              'Time',
                            ),
                            containerGrid(
                              0,
                              10,
                              0,
                              0,
                              Colors.black,
                              HexColor(ThemesOfProject().secondary_colors),
                              Colors.white,
                              'Average',
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: Scores.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                containerGrid(
                                  0,
                                  0,
                                  0,
                                  0,
                                  Colors.black,
                                  Colors.white,
                                  Colors.black,
                                  '${index + 1}',
                                ),
                                containerGrid(
                                  0,
                                  0,
                                  0,
                                  0,
                                  Colors.black,
                                  Colors.white,
                                  Colors.black,
                                  timeInStandard(Scores[index]),
                                ),
                                containerGrid(
                                  0,
                                  0,
                                  0,
                                  0,
                                  Colors.black,
                                  Colors.white,
                                  Colors.black,
                                  '${(Scores[index] / totalQusetion).toStringAsFixed(1)} Sec',
                                ),
                              ],
                            );
                          },
                        ),

                      ],
                    ),

                  ),

                  SizedBox(height: Get.height * 0.1),
                  SizedBox(
                    width: Get.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#a10838'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            ),
          ),
          const AppBarCustom(
            title: 'ScoreBoard',
            isCenter: true,
            showSettingIcon: false,
          ),
        ],
      ),
    );
  }


  Widget containerGrid(
      int topLeft,
      int topRight,
      int bottomLeft,
      int bottomRight,
      Color borderColor,
      Color boxColor,
      Color textColor,
      String containerText) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.toDouble()),
            topRight: Radius.circular(topRight.toDouble()),
            bottomLeft: Radius.circular(bottomLeft.toDouble()),
            bottomRight: Radius.circular(bottomRight.toDouble()),
          ),
          border: Border.all(width: 1, color: borderColor),
        ),
        child: Center(
            child: Text(
          containerText,
          style: TextStyle(
              fontFamily: 'Oswald',
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: textColor),
        )),
      ),
    );
  }
}
