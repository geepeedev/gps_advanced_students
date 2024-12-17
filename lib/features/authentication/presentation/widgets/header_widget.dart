import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
// import 'package:godspath_student/core/common/widgets/text/text.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GpText.headline(
          text: 'Welcome back!',
          fontsize: 50,
          textColor: GpColors.textlight,
        ),
        const Gap(3),
        GpText.body(
          text: 'Login to get started',
          fontsize: 18,
          fontWeight: FontWeight.w400,
          textColor: GpColors.onPrimary,
        ),
        const Gap(40),
      ],
    );
  }
}
