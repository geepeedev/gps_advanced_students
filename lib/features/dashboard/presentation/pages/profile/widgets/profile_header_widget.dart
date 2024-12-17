import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // user first name
        Card(
          color: GpColors.secondary.withOpacity(0.8),
          // elevation: 3,
          // shadowColor: GpColors.onsecondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: GpText.body(
              text: 'Osoise',
              textColor: const Color.fromARGB(255, 143, 2, 61),
            ),
          ),
        ),
        // user profile picture
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.elliptical(18, 18)),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: const Center(
            child: Icon(IconsaxPlusLinear.user_add),
          ),
        )
      ],
    );
  }
}