import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/shared/background.dart';
import '../../../../Data/question_generate.dart';
import '../../../../shared/alertBox.dart';
import '../../../../shared/app_bar.dart';
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
    return WillPopScope(
      onWillPop: () async => MyAppAlertBox.showExitConfirmationDialog(
          context: context,
          Title: 'Confirm Quit',
          Body:
          'Exiting this screen will result in losing your current game progress.\n\nAre you sure you want to continue?',
          FunYesButton: () {
            Navigator.of(context).pop(true);
            Navigator.of(context).pop(true);
          }
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CommonUsedWidget.background(
          child: Stack(
            children: [
              Column(
                children: [
                  TimerWidget(time()),
                  Question(),
                  AnswerArea(),
                  fillAvailableSpace(),
                  giveInfoOfGame(),
                  fillAvailableSpace(),
                  keyPad(),
                ],
              ),
              const AppBarCustom(
                  title: '', isCenter: true, showSettingIcon: false),
              SafeArea(
                  child: IconButton(
                      onPressed: () {
                        MyAppAlertBox.showExitConfirmationDialog(
                            context: context,
                            Title: 'Confirm Quit',
                            Body:
                                'Exiting this screen will result in losing your current game progress.\n\nAre you sure you want to continue?',
                            FunYesButton: () {
                              Navigator.of(context).pop(true);
                              Navigator.of(context).pop(true);
                            }
                          );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget myColumn({required List<Widget> children}) {
    return Expanded(
      child: Column(
        children: children,
      ),
    );
  }

  Widget Question() {
    return Card(
      color: Colors.black.withOpacity(0.3),
      shadowColor: ColorOfApp.cardShadow,
      elevation: 30,
      child: Center(
          child: Text(question,
              style: const TextStyle(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white))),
    );
  }

  Widget AnswerArea() {
    return Card(
      color: Colors.white.withOpacity(0.8),
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
        color: ColorOfApp.cardShadow.withOpacity(0.3),
        splashColor: ColorOfApp.cardShadow.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.toDouble()),
            topRight: Radius.circular(topRight.toDouble()),
            bottomLeft: Radius.circular(bottomLeft.toDouble()),
            bottomRight: Radius.circular(bottomRight.toDouble()),
          ),
          side: BorderSide(
              color: ColorOfApp.background.withOpacity(0.5), width: 2),
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
        color: Colors.transparent,
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
        color: ColorOfApp.cardShadow.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.toDouble()),
            topRight: Radius.circular(topRight.toDouble()),
            bottomLeft: Radius.circular(bottomLeft.toDouble()),
            bottomRight: Radius.circular(bottomRight.toDouble()),
          ),
          side: BorderSide(
              color: ColorOfApp.background.withOpacity(0.5), width: 2),
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

  Widget giveInfoOfGame() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            // settingPageRed();
          },
          child: Card(
            color: ColorOfApp.card.withOpacity(0.5),
            shadowColor: ColorOfApp.cardShadow,
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
        ),
        GestureDetector(
          onTap: () {
            // settingPageRed();
          },
          child: Card(
            color: ColorOfApp.card.withOpacity(0.5),
            shadowColor: ColorOfApp.cardShadow,
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
        ),
      ],
    );
  }

  Widget keyPad() {
    Widget mobileKeyboard() {
      return Column(
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
      );
    }

    Widget calculatorkeypad() {
      return Column(
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
      );
    }

    if (keyType == 1) {
      return mobileKeyboard();
    } else {
      return calculatorkeypad();
    }
  }

  Widget fillAvailableSpace() {
    return const Expanded(child: SizedBox());
  }
}
