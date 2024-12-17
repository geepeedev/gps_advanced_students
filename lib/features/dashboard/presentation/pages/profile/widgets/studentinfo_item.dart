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
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GpText.headline(
              fontWeight: FontWeight.normal,
              text: itemLabel,
              textColor: GpColors.onPrimary,
              fontsize: 18,
            ),
            GpText.headline(
              fontWeight: FontWeight.normal,
              text: jsonData,
              textColor: GpColors.textlight,
              fontsize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
