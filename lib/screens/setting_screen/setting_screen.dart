import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/IntroScreenWidgets.dart';
import '../../shared/app_bar.dart';
import '../../shared/theme.dart';

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
      backgroundColor: HexColor(ThemesOfProject().background),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  GestureDetector(
                    child: beautifulLottieCard(
                        widthIs: MediaQuery.of(context).size.width*0.8,
                        heightIs: MediaQuery.of(context).size.width*0.5,
                      cardColor: ThemesOfProject().secondary_colors,
                      cardShadingColor: _isClicked? ThemesOfProject().background : '#a3a2ba',
                      lottieAsset: appAssets.lottieSetting,),

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

                  const SizedBox(height: 50,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: HexColor(ThemesOfProject().secondary_colors),
                        ),
                        child: Column(
                          children: [
                            const Text('Total Question', style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            )),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _totalQuestionRadio(10),
                                _totalQuestionRadio(20),
                                _totalQuestionRadio(30),
                                _totalQuestionRadio(40),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: HexColor(ThemesOfProject().secondary_colors),
                        ),
                        child: Column(
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.width*1.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: HexColor(cardShadingColor),
                          //     blurStyle: BlurStyle.outer,
                          //     spreadRadius: 1,
                          //     blurRadius: 40,
                          //   )
                          // ],
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: HexColor(ThemesOfProject().secondary_colors),
                        ),
                        child: Column(
                          
                          children: [
                            const Text('Keyboard Type', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            )),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _keyTypeRadio(1, 'Phone'),
                                _keyTypeRadio(2, 'Calculator'),
                              ],
                            ),


                            Expanded(child: _keyBoardType())


                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25,),
                ],
              ),
            ),
          ),

          const AppBarCustom(title: 'Game Settings',
              isCenter: true,
              showSettingIcon: false),
        ],
      ),
    );
  }
  Widget _totalQuestionRadio(int value) {
    return Row(
      children: [
        Radio(
          activeColor: Colors.amber,
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
          activeColor: Colors.amber,
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
          activeColor: Colors.amber,
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
    return Container(
        width: 60,
        height: 60,
        decoration:
        value.toString().isEmpty?
        BoxDecoration(color: HexColor(ThemesOfProject().secondary_colors)):
        BoxDecoration(
            color: Colors.amberAccent.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Colors.black,
                width: 3
            )
        ),
        child: Center(child: Text(value.toString(), style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700
        ),)),
      );
  }
}


