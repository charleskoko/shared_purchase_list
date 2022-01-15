import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

buildFlashNotification(
    {required String? title, Color? textColor, required context}) {
  return showFlash(
    context: context,
    duration: const Duration(seconds: 5),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        behavior: FlashBehavior.floating,
        position: FlashPosition.top,
        boxShadows: kElevationToShadow[4],
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        child: FlashBar(
          content: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.black,
            ),
          ),
        ),
      );
    },
  );
}
