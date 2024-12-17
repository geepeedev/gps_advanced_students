import 'package:flutter/material.dart';

class KHelpers {
  static bool isDesktopLg(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  // colorsExtension(BuildContext context) {
  //   return Theme.of(context).extension<GpColors>();
  // }
}
