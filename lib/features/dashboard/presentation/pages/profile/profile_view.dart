import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/profile_body_layout.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/profile_header_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(30),
        ProfileHeaderWidget(),
        Gap(50),
        ProfileBodyWidget(),
      ],
    ).animate().fadeIn(duration: Durations.medium4);
  }
}
