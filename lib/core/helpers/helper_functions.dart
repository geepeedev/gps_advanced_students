import 'package:flutter/material.dart';

class KHelpers {
  static bool isDesktopLg(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    return pickedDate;
  }
}
