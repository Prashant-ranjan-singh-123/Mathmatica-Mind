import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';
import 'package:mathmatics_mind/Data/app_strings.dart';
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
                  FadeInDown(child: topImageWidget()),
                  JelloIn(delay: const Duration(milliseconds: 200), child: nameOdDev()),
                  ZoomIn(delay: const Duration(milliseconds: 600), child: socialMedia()),
                  SlideInUp(delay: const Duration(milliseconds: 800), child: aboutText()),
                  SlideInUp(delay: const Duration(milliseconds: 1400), child: socialProfileSelf())
                  // experience()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padding_between_element({required Widget child}) {
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
    return padding_between_element(
      child: Center(
        child: isHeightBigger()
            ? Card(
              color: Colors.transparent,
              shadowColor: ColorOfApp.cardShadow,
              elevation: 40,
              child: FittedBox(fit: BoxFit.cover, child: Image.asset(appAsset.featureGraphic,)),
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
    return padding_between_element(
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

  Widget aboutText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        color: ColorOfApp.card,
        shadowColor: ColorOfApp.cardShadow,
        elevation: 30,
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
    // --Buttons Logic--
    Widget AppButton(
        {required String Assetname,
        required Function fun,
        String iconData = ''}) {
      return Center(
        child: Row(
          children: [
            Card(
              color: ColorOfApp.card,
              elevation: 5,
              shadowColor: ColorOfApp.cardShadow,
              child: SizedBox(
                width: Get.width * 0.13,
                height: Get.width * 0.13,
                child: IconButton(
                  onPressed: () {
                    fun();
                  },
                  icon: Image.asset(Assetname),
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

    Widget AppButtonIcon({required IconData Iconname, required Function fun}) {
      return Center(
        child: Row(
          children: [
            Card(
              color: ColorOfApp.card,
              elevation: 5,
              shadowColor: ColorOfApp.cardShadow,
              child: SizedBox(
                width: Get.width * 0.25,
                height: Get.width * 0.13,
                child: IconButton(
                  onPressed: () {
                    fun();
                  },
                  icon: Transform.scale(
                      scale: 1.7,
                      child: Icon(
                        Iconname,
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

    return padding_between_element(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Row(
          children: [
            AppButtonIcon(
              Iconname: MdiIcons.linkedin,
              fun: AboutUsScreenLogic.openLinkedin,
            ),
            AppButtonIcon(
              Iconname: MdiIcons.github,
              fun: AboutUsScreenLogic.openGithub,
            ),
            AppButtonIcon(
              Iconname: MdiIcons.googlePlay,
              fun: AboutUsScreenLogic.openGmail,
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
}
