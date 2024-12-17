import 'dart:ui';
import 'package:gps_advanced_students/core/constants/colors.dart';

enum OnboardingEnum {
  onboarding1(
      color: GpColors.primary,
      image: 'assets/onboarding/Finish line-cuate.svg',
      title: 'Your road to success.'),
  onboarding2(
      color: GpColors.secondary,
      image: 'assets/onboarding/Learning-cuate.svg',
      title: 'The perfect study center.'),
  onboarding3(
      color: GpColors.onPrimary,
      image: 'assets/onboarding/In progress-pana.svg',
      title: 'Achieving true progress for a better future.'),
  onboarding4(
      color: GpColors.onsecondary,
      image: 'assets/onboarding/Teaching-pana.svg',
      title: 'Learning from the best of the best');

  final Color color;
  final String image;
  final String title;

  const OnboardingEnum(
      {required this.color, required this.image, required this.title});
}
