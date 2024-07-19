import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../screens/global_nav_bar/setting_screen/setting_screen.dart';
import 'theme.dart';


class AppBarCustom extends StatelessWidget {
  final String title;
  final bool isCenter;
  final bool showSettingIcon;
  const AppBarCustom(
      {super.key,
      required this.title,
      required this.isCenter,
      required this.showSettingIcon});

  void settingFun(){
    Get.to(const SettingsPage(),
        curve: Curves.linear,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorOfApp.cardShadow.withOpacity(0.8)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isCenter)
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: ColorOfApp.textBold,
                  ),
                ),
              )
            else
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: ColorOfApp.textBold,
                ),
              ),
            if (showSettingIcon)
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      settingFun();
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
