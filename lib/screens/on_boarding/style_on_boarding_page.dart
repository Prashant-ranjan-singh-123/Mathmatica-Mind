import 'package:flutter/material.dart';
import 'package:mathmatics_mind/shared/theme.dart';

class TextStyleIs{
  TextStyle skip_and_next(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontFamily: 'Roboto',
      color: Theme.of(context).colorScheme.background
    );
  }

  TextStyle heading() {
    return const TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: ColorOfApp.textBold
    );
  }
  TextStyle subtitle() {
    return const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: ColorOfApp.textLight
    );
  }
}