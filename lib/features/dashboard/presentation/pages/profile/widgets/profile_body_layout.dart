import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/helpers/helper_functions.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/attendance_widget.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/payment_widget.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/studentinfo_management.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: KHelpers.isDesktopLg(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: KHelpers.isDesktopLg(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      direction:
          KHelpers.isDesktopLg(context) ? Axis.horizontal : Axis.vertical,
      children: const [
        Flexible(
          fit: FlexFit.loose,
          // student information container
          child: StudentProfileWidget(),
        ),
        Gap(8),
        // attendance container
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // attendance container
              AttendanceWidget(),
              Gap(8),
              // pesonal information container
              PaymentsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}