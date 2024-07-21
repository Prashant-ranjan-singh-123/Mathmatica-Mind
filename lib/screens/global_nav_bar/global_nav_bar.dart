import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/about_us/about_us_screen.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/home_screen/intro_screen.dart';
import 'package:mathmatics_mind/screens/global_nav_bar/setting_screen/setting_screen.dart';

import '../../shared/background.dart';
import '../../shared/theme.dart';

class GlobalNavBar extends StatefulWidget {
  const GlobalNavBar({super.key});

  @override
  State<GlobalNavBar> createState() => _GlobalNavBarState();
}

class _GlobalNavBarState extends State<GlobalNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonUsedWidget.background(child: bottom_nav_bar_2_body()),
      bottomNavigationBar: bottom_nav_bar_2(),
    );
  }

  Widget bottom_nav_bar_2() {
    BottomNavigationBarItem buildNavItem(IconData icon, String label) {
      return BottomNavigationBarItem(
        icon: Card(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Icon(icon, color: Colors.white.withOpacity(0.3)),
          ),
        ),
        label: label,
        activeIcon: Card(
          color: ColorOfApp.bottomNavCard,
          elevation: 15,
          shadowColor: ColorOfApp.bottomNavCardShadow,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Icon(icon, color: ColorOfApp.bottomNavActiveIcon),
          ),
        ),
      );
    }

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: ColorOfApp.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: ColorOfApp.bottomNavInactiveItem,
        selectedItemColor: ColorOfApp.bottomNavActiveText,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                _selectedIndex = 0;
                break;
              case 1:
                _selectedIndex = 1;
                break;
              case 2:
                _selectedIndex = 2;
                break;
              default:
                _selectedIndex = 0;
                break;
            }
          });
        },
        items: [
          buildNavItem(Iconsax.gameboy, 'Game Play'),
          buildNavItem(Iconsax.setting, 'Settings'),
          buildNavItem(Iconsax.code, 'About Us'),
        ],
      ),
    );
  }

  Widget bottom_nav_bar_2_body() {
    if (_selectedIndex == 0) {
      return const IntroScreen();
    } else if (_selectedIndex == 1) {
      return const SettingsPage();
    } else {
      return AboutUsScreen();
    }
  }
}