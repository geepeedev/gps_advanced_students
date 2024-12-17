
import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class PaymentsWidget extends StatelessWidget {
  const PaymentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 800,
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 6,
        right: 6,
        left: 6,
      ),
      decoration: const BoxDecoration(
        color: GpColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GpText.headline(
            text: 'Payment Information',
            textColor: GpColors.textlight,
            fontsize: 30,
          )
        ],
      ),
    );
  }
}
