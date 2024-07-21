import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../Data/app_assets.dart';
import '../../../Data/app_strings.dart';
import '../../../shared/background.dart';
import '../../../shared/global_var_and_fun.dart';
import '../../../shared/theme.dart';
import 'about_us_screen_data.dart';
import 'about_us_screen_logic.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  var appAsset;
  var appData;

  @override
  void initState() {
    appAsset = Get.find<AppAssets>();
    appData = Get.find<AppStrings>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonUsedWidget.background(
        child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      child: headingAndSubtitleTop(),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      child: topImageWidget(),
                    ),
                    FadeInRightBig(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 400),
                      curve: Curves.easeOutQuart,
                      child: socialMedia(),
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 600),
                      curve: Curves.easeOutQuart,
                      child: mitLicence(),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 600),
                      curve: Curves.easeOutQuart,
                      child: aboutText(),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 600),
                      curve: Curves.easeOutQuart,
                      child: socialProfileSelf(),
                    ),
                    // experience()
                  ],
                ),
              ),
            ),
          ),
      ),

    );
  }

  Widget paddingBetweenElement({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: child,
    );
  }

  Widget heading({
    required String heading,
    double paddingTop = 20.0,
    double paddingBottom = 20.0,
    double fontSize = 40,
    bool isCenter = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: isCenter
          ? Center(
              child: AutoSizeText(
                heading,
                maxLines: 1,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: ColorOfApp.textBold,
                ),
              ),
            )
          : AutoSizeText(
              heading,
              maxLines: 1,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                color: ColorOfApp.textBold,
              ),
            ),
    );
  }

  Widget topImageWidget() {
    return paddingBetweenElement(
      child: Center(
        child: isHeightBigger()
            ? Card(
              color: Colors.transparent,
              shadowColor: ColorOfApp.cardShadow,
              elevation: 40,
              child: Image.asset(appAsset.featureGraphic,),
            )
            : Card(
            color: Colors.transparent,
            shadowColor: ColorOfApp.cardShadow,
            elevation: 40,
            child: Image.asset(appAsset.featureGraphic,)),
      ),
    );
  }

  Widget nameOdDev() {
    return paddingBetweenElement(
      child: isHeightBigger()
          ? Center(
              child: AutoSizeText(
                AboutUsScreenData.name,
                maxLines: 1,
                style: TextStyle(
                    color: ColorOfApp.textBold,
                    fontSize: Get.width * 0.1,
                    fontFamily: 'Oswald'),
              ),
            )
          : Center(
              child: AutoSizeText(
                AboutUsScreenData.name,
                maxLines: 1,
                style: TextStyle(
                    color: ColorOfApp.textBold,
                    fontSize: Get.width * 0.1,
                    fontFamily: 'Oswald'),
              ),
            ),
    );
  }

  Widget professionOfDeveloper() {
    return isHeightBigger()
        ? Center(
            child: AutoSizeText(
              AboutUsScreenData.role,
              maxLines: 1,
              style: TextStyle(
                  fontSize: Get.width,
                  fontFamily: 'Merriweather',
                  color: ColorOfApp.textLight),
            ),
          )
        : Center(
            child: AutoSizeText(
              AboutUsScreenData.role,
              maxLines: 1,
              style: TextStyle(
                  fontSize: Get.width,
                  fontFamily: 'Merriweather',
                  color: ColorOfApp.textLight),
            ),
          );
  }

  Widget mitLicence() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow,
        elevation: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              heading(heading: 'MIT License', paddingTop: 0, paddingBottom: 20),
              const Text(
                AboutUsScreenData.mitLicense,
                style: TextStyle(color: ColorOfApp.textLight),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        color: ColorOfApp.card.withOpacity(0.5),
        shadowColor: ColorOfApp.cardShadow,
        elevation: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              heading(heading: 'Yours Contribution', paddingTop: 0, paddingBottom: 20),
              const Text(
                AboutUsScreenData.descriptionShort,
                style: TextStyle(color: ColorOfApp.textLight),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget socialMedia() {

    Widget appButtonIcon({required IconData iconName, required Function fun}) {
      return Center(
        child: Row(
          children: [
            Card(
              color: ColorOfApp.card,
              elevation: 5,
              shadowColor: ColorOfApp.cardShadow,
              child: SizedBox(
                width: Get.width * 0.25,
                height: Get.width * 0.15,
                child: IconButton(
                  onPressed: () {
                    fun();
                  },
                  icon: Transform.scale(
                      scale: 1.7,
                      child: Icon(
                        iconName,
                        color: ColorOfApp.homeIconColor,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.03,
            )
          ],
        ),
      );
    }

    return paddingBetweenElement(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Row(
          children: [
            appButtonIcon(
              iconName: MdiIcons.googlePlay,
              fun: AboutUsScreenLogic.openAppOnPlayStore,
            ),
            appButtonIcon(
              iconName: MdiIcons.github,
              fun: AboutUsScreenLogic.openGithubProject,
            ),
            appButtonIcon(
              iconName: MdiIcons.linkedin,
              fun: AboutUsScreenLogic.openLinkedin,
            ),
          ],
        ),
      ),
    );
  }

  Widget contactMe() {
    return Column(
      children: [
        heading(heading: 'Contact Developer', fontSize: 40),
        const Text(
          AboutUsScreenData.contactDescription,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: 'OpenSans',
            color: ColorOfApp.textLight,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget socialProfileSelf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        heading(heading: 'About Creator', fontSize: 30, paddingTop: 40, paddingBottom: 10),
        Container(
            height: Get.height * 0.35,
            padding: const EdgeInsets.all(38),
            child: AnimatedStackWidget(
              itemCount: AboutUsScreenData().socialLinks.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      AboutUsScreenLogic.openWebsite();
                      break;
                    case 1:
                      AboutUsScreenLogic.openGithub();
                      break;
                    case 2:
                      AboutUsScreenLogic.openLinkedin();
                      break;
                    case 3:
                      AboutUsScreenLogic.openTelegram();
                      break;
                    case 4:
                      AboutUsScreenLogic.openGmail();
                      break;
                  }
                },
                child: MagazineCoverImage(
                  image: AboutUsScreenData().socialLinks[index]![0],
                ),
              ),
            )),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget headingAndSubtitleTop() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            'Mathmatica Mind',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: ColorOfApp.textBold,
                fontFamily: 'Oswald'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            'Mathematical Skills',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              fontFamily: 'OpenSans',
              color: ColorOfApp.textLight,
            ),
          ),
        )
      ],
    );
  }
}