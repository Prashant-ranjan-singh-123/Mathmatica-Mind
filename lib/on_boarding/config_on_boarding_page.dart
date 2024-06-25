import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../Theme/theme.dart';
import '../screens/intro_screen.dart';
import 'on_boarding_page_1.dart';
import 'on_boarding_page_2.dart';
import 'on_boarding_page_3.dart';
import 'on_boarding_page_4.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast=false;
  bool isFirst=true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    List pages;
    pages = [
      const PageOne(),
      const PageTwo(),
      const PageThree(),
      const PageFour()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(ThemesOfProject().primary_colors),
        toolbarHeight: 15,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
                onPageChanged: (int val){
                  if(val==0){
                    isLast=false;
                    isFirst=true;
                  }if(val==3){
                    isLast=true;
                    isFirst=false;
                  }if(val!=3&&val!=0){
                    isLast=false;
                    isFirst=false;
                  }
                  setState(() {
                    isLast;
                    isFirst;
                  });
                },
              controller: controller,
                children: List.generate(pages.length, (index) => pages[index]),
            ),
          ),
          Align(
            alignment: const Alignment(0,0.93),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!isFirst) InkWell(
                  onTap: (){
                    controller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                  },
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent.shade200,
                      child: const Icon(Icons.navigate_before, color: Colors.black,),
                    )
                )
                else CircleAvatar(
                  backgroundColor: HexColor(ThemesOfProject().secondary_colors),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ScrollingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.amberAccent.shade200,
                    fixedCenter: true,
                      dotWidth: 7,
                    activeDotScale: 1.1,
                    dotHeight: 7
                  ),
                ),
                if (!isLast) InkWell(
                  onTap: (){
                    controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                  },
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent.shade200,
                      child: const Icon(Icons.navigate_next, color: Colors.black,),
                    ))
                else InkWell(
                  onTap: (){
                    Get.off(const IntroScreen(), transition: Transition.zoom, duration: const Duration(milliseconds: 450));
                  }, child: CircleAvatar(
                  backgroundColor: Colors.amberAccent.shade200,
                  child: const Icon(Icons.navigate_next, color: Colors.black,),
                ))
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: SvgPicture.asset(
          //     'assets/onboarding/wave.svg',
          //     color: Theme.of(context).colorScheme.primary,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
        ],
      ),
    );
  }
}