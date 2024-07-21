import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/shared/background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/IntroScreenWidgets.dart';
import '../../../shared/app_bar.dart';
import '../../../shared/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
int _totalQusetion=10;
int _difficulty=1;
int _keyboardType=1;
SharedPreferences? pref;
bool _isClicked = false;

class _SettingsPageState extends State<SettingsPage> {
  final appAssets = Get.find<AppAssets>();

  var keyBoardMap={
    00:1,10:2,20:3,
    01:4,11:5,21:6,
    02:7,12:8,22:9,
    13:0
  };

  void totQuesValChange(){
    pref?.setInt('tot_ques', _totalQusetion);
  }

  void diffLevValChange(){
    pref?.setInt('hardness_level', _difficulty);
  }

  void keyTypeChange(){
    pref?.setInt('key_type', _keyboardType);
    setState(() {
      if(_keyboardType==1){
        keyBoardMap={
          00:1,10:2,20:3,
          01:4,11:5,21:6,
          02:7,12:8,22:9,
          13:0
        };
      }else{
        keyBoardMap={
          00:7,10:8,20:9,
          01:4,11:5,21:6,
          02:1,12:2,22:3,
          13:0
        };
      }
    });
  }

  void setInitalValue() async{
    pref = await SharedPreferences.getInstance();
    int? tQues = pref?.getInt('tot_ques');
    if (tQues == null){
      pref?.setInt('tot_ques', 10);
    }else{
      _totalQusetion=tQues;
    }
    int? hardness = pref?.getInt('hardness_level');
    if (hardness == null){
      pref?.setInt('hardness_level', 1);
    }else{
      _difficulty=hardness;
    }
    int? keyType = pref?.getInt('key_type');
    if (keyType == null){
      pref?.setInt('key_type', 1);
    }else{
      _keyboardType=keyType;
    }
    setState(() {});
  }

  void boxShadowOnOff() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      if(_isClicked==true){
        _isClicked=false;
      }else{
        _isClicked=true;
      }
      setState(() {});
      print('isClick: $_isClicked');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // boxShadowOnOff();
    setInitalValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonUsedWidget.background(
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      child: heading(),
                    ),
                    BounceInUp(
                      duration: const Duration(milliseconds: 900),
                      delay: const Duration(milliseconds: 400),
                      curve: Curves.elasticOut,
                      child: gameCard(),
                    ),
                    FadeInRightBig(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 400),
                      curve: Curves.easeOutQuart,
                      child: totalQues(),
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 600),
                      curve: Curves.easeOutQuart,
                      child: difficult(),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      delay: const Duration(milliseconds: 800),
                      curve: Curves.easeOutQuart,
                      child: keyboard(),
                    ),
                  ],
                ),
              ),
            ),
        
            const AppBarCustom(title: '',
                isCenter: true,
                showSettingIcon: false),
          ],
        ),
      ),
    );
  }

  Widget heading(){
    return const Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              'Game Settings',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: ColorOfApp.textBold,
                  fontFamily: 'Oswald'),
            ),
          ),
        ],
      ),
    );
  }

  Widget gameCard(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        child: beautifulLottieCard(
          widthIs: MediaQuery.of(context).size.width*0.8,
          heightIs: MediaQuery.of(context).size.width*0.5,
          cardColor: ColorOfApp.card,
          cardShadingColor: _isClicked? Colors.transparent : ColorOfApp.cardShadow.withOpacity(0.4),
          lottieAsset: appAssets.lottieOnboardBrain,),

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
    );
  }

  Widget totalQues(){
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow,
        elevation: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Total Question', style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _totalQuestionRadio(10),
                  _totalQuestionRadio(20),
                  _totalQuestionRadio(30),
                  _totalQuestionRadio(40),
                  const SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget difficult(){
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow,
        elevation: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Difficulty', style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _difficultyRadio(1, 'Easy'),
                  _difficultyRadio(2, 'Medium'),
                  _difficultyRadio(3, 'Hard'),
                  const SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget keyboard(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow,
        elevation: 80,
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.width*1.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Text('Keyboard Type', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                )),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      _keyTypeRadio(1, 'Phone'),
                      _keyTypeRadio(2, 'Calculator'),
                      const SizedBox()
                    ],
                  ),
                ),


                Expanded(child: _keyBoardType())


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _totalQuestionRadio(int value) {
    return Row(
      children: [
        Radio(
          activeColor: ColorOfApp.cardShadow,
          value: value,
          groupValue: _totalQusetion,
          onChanged: (int? newValue) {
            setState(() {
              _totalQusetion = newValue!;
              totQuesValChange();
            });
          },
        ),
        Text('$value', style: const TextStyle(color: Colors.white),),
      ],
    );
  }

  Widget _difficultyRadio(int value, String difficulty) {
    return Row(
      children: [
        Radio(
          activeColor: ColorOfApp.cardShadow,
          value: value,
          groupValue: _difficulty,
          onChanged: (int? newValue) {
            setState(() {
              _difficulty = newValue!;
              diffLevValChange();
            });
          },
        ),
        Text(difficulty, style: const TextStyle(color: Colors.white),),
      ],
    );
  }

  Widget _keyTypeRadio(int value, String keyboardType) {
    return Row(
      children: [
        Radio(
          activeColor: ColorOfApp.cardShadow,
          value: value,
          groupValue: _keyboardType,
          onChanged: (int? newValue) {
            setState(() {
              _keyboardType = newValue!;
              keyTypeChange();
            });
          },
        ),
        Text(keyboardType, style: const TextStyle(color: Colors.white),),
      ],
    );
  }

  Widget _keyBoardType(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          _keyboardCard(keyBoardMap[00].toString()),
          _keyboardCard(keyBoardMap[10].toString()),
          _keyboardCard(keyBoardMap[20].toString()),
        ],),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCard(keyBoardMap[01].toString()),
            _keyboardCard(keyBoardMap[11].toString()),
            _keyboardCard(keyBoardMap[21].toString()),
          ],),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCard(keyBoardMap[02].toString()),
            _keyboardCard(keyBoardMap[12].toString()),
            _keyboardCard(keyBoardMap[22].toString()),
          ],),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCard(''),
            _keyboardCard(keyBoardMap[13].toString()),
            _keyboardCard(''),
          ],),
      ],
    );
  }

  Widget _keyboardCard(String value){
    Widget displayCard(){
      return Card(
        color: Colors.transparent,
        elevation: 10,
        shadowColor: ColorOfApp.cardShadow,
        child: Container(
          width: Get.width*0.15,
          height: Get.width*0.15,
          decoration: BoxDecoration(
              color: ColorOfApp.cardShadow.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              // border: Border.all(
              //     color: Colors.black,
              //     width: 3
              // )
          ),
          child: Center(child: Text(value.toString(), style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700
          ),)),
        ),
      );
    }

    if(value.isNotEmpty){
      return displayCard();
    }else{
      return const SizedBox();
    }
  }
}


