import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:godspath_student/core/common/widgets/text/text.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingTitle,
    required this.onboardingImage,
    required this.onboaringColor,
  });

  final String onboardingTitle;
  final String onboardingImage;
  final Color onboaringColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: onboaringColor, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              onboardingImage,
            ),
            GpText.body(
              text: onboardingTitle,
              fontsize: 25,
              textColor: GpColors.textlight,
            )
          ],
        ),
      ),
    );
  }
}
