import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Data/question_generate.dart';
import '../../../../shared/theme.dart';
import 'game_result_screen.dart';

class RealGame extends StatefulWidget {
  const RealGame({super.key});

  @override
  State<RealGame> createState() => _RealGameState();
}

class _RealGameState extends State<RealGame> {
  late Timer _timer;
  int _seconds = 0;
  var totalQusetion;
  var currQusNum = 0;
  int totalIncorrect = 0;
  var operation;
  var difficulty;
  var keyType;
  String difficultyIs = 'Easy';
  int answer = 0;
  String question = '';
  int correctAnswer = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _seconds++;
        });
      },
    );
  }

  String time() {
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

  bool isGameOver() {
    if (currQusNum > totalQusetion - 1) {
      return true;
    } else {
      return false;
    }
  }

  void currentNumPress(String num) {
    switch (num) {
      case '0':
        answer = answer * 10 + 0;
        break;
      case '1':
        answer = answer * 10 + 1;
        break;
      case '2':
        answer = answer * 10 + 2;
        break;
      case '3':
        answer = answer * 10 + 3;
        break;
      case '4':
        answer = answer * 10 + 4;
        break;
      case '5':
        answer = answer * 10 + 5;
        break;
      case '6':
        answer = answer * 10 + 6;
        break;
      case '7':
        answer = answer * 10 + 7;
        break;
      case '8':
        answer = answer * 10 + 8;
        break;
      case '9':
        answer = answer * 10 + 9;
        break;
      default:
        answer = (answer ~/ 10);
        break;
    }
    setState(() {});

    if (answer == correctAnswer) {
      currQusNum++;
      answer = 0;
      setExpression();
    } else if (answer > correctAnswer) {
      answer = 0;
      totalIncorrect++;
      setState(() {});
    }

    if (isGameOver()) {
      Get.off(() => const GameResult(), arguments: {
        'seconds': _seconds,
        'Timer': time(),
        'totalQusetion': totalQusetion,
        'difficulty': difficulty,
        'operation': operation,
      });
    }
  }

  void setExpression() {
    if (operation == 'Addition') {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 1, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} + ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 'Subtraction') {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 2, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} - ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 'Multiply') {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 3, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} X ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 'Division') {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 4, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} / ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 'SquareRoot') {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 5, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '√${questionIs['num']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else {
      mixed();
    }
    setState(() {});
  }

  void mixed() {
    Random rm = Random();
    int generateRandomNumber(int min, int max) {
      return min + rm.nextInt(max - min + 1);
    }

    operation = generateRandomNumber(1, 5);
    if (operation == 1) {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 1, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} + ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 2) {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 2, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} - ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 3) {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 3, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} X ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 4) {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 4, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '${questionIs['num1']} / ${questionIs['num2']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    } else if (operation == 5) {
      QuestionGenerate questionGenerator =
          QuestionGenerate(symbol: 5, hard: difficulty);
      Map<String, int> questionIs = questionGenerator.generate();
      question = '√${questionIs['num']}';
      correctAnswer = questionIs['ans'] ?? 0;
      print(correctAnswer);
    }
    setState(() {});
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
    setExpression();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(ThemesOfProject().background),
        // backgroundColor: HexColor('#fff'),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: HexColor(ThemesOfProject().background),
              child: SafeArea(
                  child: Column(
                children: [
                  TimerWidget(time()),
                  Question(context),
                  const SizedBox(
                    height: 3,
                  ),
                  AnswerArea(context),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // settingPageRed();
                        },
                        child: Container(
                          // height: 180,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor(ThemesOfProject().card_shadow),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1,
                                blurRadius: 20,
                              )
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: HexColor(ThemesOfProject().secondary_colors),
                          ),
                          child: Center(
                              child: Text(
                            'Question\n$currQusNum/$totalQusetion',
                            style: const TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // settingPageRed();
                        },
                        child: Container(
                          // height: 180,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor(ThemesOfProject().card_shadow),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1,
                                blurRadius: 20,
                              )
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: HexColor(ThemesOfProject().secondary_colors),
                          ),
                          child: Center(
                              child: Text(
                            'Incorrect\n$totalIncorrect',
                            style: const TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  if (keyType == 1)
                    Column(
                      children: [
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('1');
                            }, 10, 10, 0, 0, '1'),
                            buttonText(context, () {
                              currentNumPress('2');
                            }, 10, 10, 0, 0, '2'),
                            buttonText(context, () {
                              currentNumPress('3');
                            }, 10, 10, 0, 0, '3'),
                          ],
                        ),
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('4');
                            }, 0, 0, 0, 0, '4'),
                            buttonText(context, () {
                              currentNumPress('5');
                            }, 0, 0, 0, 0, '5'),
                            buttonText(context, () {
                              currentNumPress('6');
                            }, 0, 0, 0, 0, '6'),
                          ],
                        ),
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('7');
                            }, 0, 0, 0, 0, '7'),
                            buttonText(context, () {
                              currentNumPress('8');
                            }, 0, 0, 0, 0, '8'),
                            buttonText(context, () {
                              currentNumPress('9');
                            }, 0, 0, 0, 0, '9'),
                          ],
                        ),
                        Row(
                          children: [
                            emptyBox(context),
                            buttonText(context, () {
                              currentNumPress('0');
                            }, 0, 0, 10, 10, '0'),
                            buttonIcon(
                              context,
                              () {
                                currentNumPress('back');
                              },
                              0,
                              0,
                              10,
                              10,
                            )
                          ],
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('7');
                            }, 0, 0, 0, 0, '7'),
                            buttonText(context, () {
                              currentNumPress('8');
                            }, 0, 0, 0, 0, '8'),
                            buttonText(context, () {
                              currentNumPress('9');
                            }, 0, 0, 0, 0, '9'),
                          ],
                        ),
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('4');
                            }, 0, 0, 0, 0, '4'),
                            buttonText(context, () {
                              currentNumPress('5');
                            }, 0, 0, 0, 0, '5'),
                            buttonText(context, () {
                              currentNumPress('6');
                            }, 0, 0, 0, 0, '6'),
                          ],
                        ),
                        Row(
                          children: [
                            buttonText(context, () {
                              currentNumPress('1');
                            }, 10, 10, 0, 0, '1'),
                            buttonText(context, () {
                              currentNumPress('2');
                            }, 10, 10, 0, 0, '2'),
                            buttonText(context, () {
                              currentNumPress('3');
                            }, 10, 10, 0, 0, '3'),
                          ],
                        ),
                        Row(
                          children: [
                            emptyBox(context),
                            buttonText(context, () {
                              currentNumPress('0');
                            }, 0, 0, 10, 10, '0'),
                            buttonIcon(
                              context,
                              () {
                                currentNumPress('back');
                              },
                              0,
                              0,
                              10,
                              10,
                            )
                          ],
                        ),
                      ],
                    )
                ],
              )),
            )
          ],
        ));
  }

  Widget Question(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: HexColor(ThemesOfProject().secondary_colors),
          border: Border.all(
              color: HexColor(ThemesOfProject().background), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(question,
              style: const TextStyle(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white))),
    );
  }

  Widget AnswerArea(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: HexColor(ThemesOfProject().background), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        answer.toString(),
        style: const TextStyle(
            fontFamily: 'Oswald', fontWeight: FontWeight.w600, fontSize: 30),
      )),
    );
  }

  Widget buttonText(BuildContext context, VoidCallback onPressed, int topLeft,
      int topRight, int bottomLeft, int bottomRight, String buttonText) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        height: 80,
        color: HexColor(ThemesOfProject().secondary_colors),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.toDouble()),
            topRight: Radius.circular(topRight.toDouble()),
            bottomLeft: Radius.circular(bottomLeft.toDouble()),
            bottomRight: Radius.circular(bottomRight.toDouble()),
          ),
          side: BorderSide(color: HexColor(ThemesOfProject().background)),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(
              fontFamily: 'Oswald',
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.white),
        )),
      ),
    );
  }

  Widget emptyBox(
    BuildContext context,
  ) {
    return Expanded(
      child: Container(
        height: 80,
        color: HexColor(ThemesOfProject().background),
      ),
    );
  }

  Widget buttonIcon(
    BuildContext context,
    VoidCallback onPressed,
    int topLeft,
    int topRight,
    int bottomLeft,
    int bottomRight,
  ) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        height: 80,
        color: HexColor(ThemesOfProject().secondary_colors),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.toDouble()),
            topRight: Radius.circular(topRight.toDouble()),
            bottomLeft: Radius.circular(bottomLeft.toDouble()),
            bottomRight: Radius.circular(bottomRight.toDouble()),
          ),
          side: BorderSide(color: HexColor(ThemesOfProject().background)),
        ),
        child: const Center(
            child: Icon(
          Icons.arrow_back_outlined,
          size: 40,
          color: Colors.white,
        )),
      ),
    );
  }

  Widget TimerWidget(String Time) {
    return SafeArea(
      child: Center(
        child: Text(
          'Timer: $Time',
          style: const TextStyle(
              fontFamily: 'Oswald',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
