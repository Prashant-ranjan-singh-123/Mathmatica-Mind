import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import 'theme.dart';

class GameCard extends StatelessWidget {
  final String heading;
  final Text icon1;
  final Function onTap;
  final String heading2;
  final Text icon2;
  final Function onTap2;

  const GameCard({
    Key? key,
    required this.heading,
    required this.onTap,
    required this.heading2,
    required this.onTap2,
    required this.icon1,
    required this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      heading,
                      // '',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#a3a2ba'),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 20,
                            )
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: HexColor(ThemesOfProject().secondary_colors),
                        ),
                        child: Center(
                          child: icon1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      heading2,
                      // '',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onTap2();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#a3a2ba'),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 20,
                            )
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: HexColor(ThemesOfProject().secondary_colors),
                        ),
                        child: Center(
                          child: icon2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class beautifulLottieCard extends StatelessWidget{
  final double widthIs;
  final double heightIs;
  final String cardColor;
  final String cardShadingColor;
  final String lottieAsset;

  const beautifulLottieCard({
    super.key,
    required this.widthIs,
    required this.heightIs,
    required this.cardColor,
    required this.cardShadingColor,
    required this.lottieAsset
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widthIs,
        height: heightIs,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: [
            BoxShadow(
              color: HexColor(cardShadingColor),
              blurStyle: BlurStyle.outer,
              spreadRadius: 1,
              blurRadius: 40,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: HexColor(cardColor),
        ),
        child: Lottie.asset(lottieAsset, width: double.infinity, height: double.infinity, reverse: true),
      ),
    );
  }
}

class beautifulLottieCardIntro extends StatelessWidget{
  final double widthIs;
  final double heightIs;
  final String cardColor;
  final String cardShadingColor;
  final String lottieAsset;

  const beautifulLottieCardIntro({
    super.key,
    required this.widthIs,
    required this.heightIs,
    required this.cardColor,
    required this.cardShadingColor,
    required this.lottieAsset
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widthIs,
        height: heightIs,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: [
            BoxShadow(
              color: HexColor(cardShadingColor),
              blurStyle: BlurStyle.normal,
              spreadRadius: 1,
              blurRadius: 20,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: HexColor(cardColor),
        ),
        child: Lottie.asset(lottieAsset, width: double.infinity, height: double.infinity, reverse: false),
      ),
    );
  }
}


class PlayerReadingText extends StatelessWidget{
  final String headLine;
  final String quote;
  final String subtitle;
  const PlayerReadingText({
    super.key,
    required this.headLine,
    required this.quote,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            headLine,
            style: TextStyle(
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w800,
              fontSize: 35,
              color: HexColor(ThemesOfProject().split_complementary_colors),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: HexColor(ThemesOfProject().square_colors),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 38, right: 38),
          child: Text(
            quote,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.amber,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

}