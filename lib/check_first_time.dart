import 'package:flutter/material.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/global_nav_bar.dart';
import 'package:mathmatics_mind/screens/on_boarding/onboard_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckFirstTime extends StatefulWidget {
  const CheckFirstTime({Key? key});

  @override
  State<CheckFirstTime> createState() => _CheckFirstTimeState();
}

class _CheckFirstTimeState extends State<CheckFirstTime> {
  late Future<bool> isFirstRun;
  @override
  void initState() {
    super.initState();
    isFirstRun = ifFirstRun();
  }

  Future<bool> ifFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirst') ?? true;
    if (isFirstRun) {
      await prefs.setBool('isFirst', false);
      return true;
    } else {
      // await prefs.setBool('isFirst', true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: ifFirstRun(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if(isFirstRun==true){
            return OnboardLogic();
          }else if (snapshot.data == true) {
            return OnboardLogic();
          }else {
            return const GlobalNavBar();
          }
        }
      },
    );
  }
}

