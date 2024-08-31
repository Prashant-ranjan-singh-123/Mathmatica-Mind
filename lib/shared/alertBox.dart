import 'package:flutter/material.dart';
import 'package:mathmatics_mind/shared/theme.dart';

class MyAppAlertBox {

  static Future<bool> showExitConfirmationDialog({
    required BuildContext context,
    required String Title,
    required String Body,
    required Function FunYesButton
  }) async {
    return await showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.95),
          builder: (BuildContext context) {
            return AlertDialog(
              elevation: 30,
              shadowColor: ColorOfApp.cardShadow,
              backgroundColor: Colors.black,
              title: Center(
                  child: Text(
                Title,
                style: const TextStyle(
                    color: ColorOfApp.textBold, fontWeight: FontWeight.w600),
              )),
              content: Text(
                Body,
                style: const TextStyle(color: ColorOfApp.textLight),
                textAlign: TextAlign.left,
              ),
              actions: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // Stay on the current screen
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                        color: ColorOfApp.textBold,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    FunYesButton();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                        color: ColorOfApp.textBold,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            );
          },
        ) ??
        false; // If the dialog is dismissed, return false
  }
}
