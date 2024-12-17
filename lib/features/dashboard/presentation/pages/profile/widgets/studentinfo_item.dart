import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class StudentInfoItemWidget extends StatelessWidget {
  const StudentInfoItemWidget({
    super.key,
    required this.jsonData,
    required this.itemLabel,
  });

  final String jsonData;
  final String itemLabel;
  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: GpColors.background.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GpText.body(
              fontWeight: FontWeight.normal,
              text: itemLabel,
              textColor: GpColors.textDark,
            ),
            GpText.body(
              fontWeight: FontWeight.w900,
              text: jsonData,
              textColor: GpColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
