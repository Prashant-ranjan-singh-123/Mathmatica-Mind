import 'package:flutter/material.dart';

class TextStyleIs{
  TextStyle skip_and_next(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontFamily: 'Roboto',
      color: Theme.of(context).colorScheme.background
    );
  }

  TextStyle heading(BuildContext context) {
    return const TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: Colors.white
    );
  }
  TextStyle subtitle(BuildContext context) {
    return const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Colors.white
    );
  }
}