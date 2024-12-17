import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({
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
        color: GpColors.onPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GpText.headline(
                text: 'Attendance',
                textColor: GpColors.textlight,
                fontsize: 30,
              ),
              // icon for editing
              Card.filled(
                color: GpColors.secondary,
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconsaxPlusLinear.book,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: HeatMapCalendar(
              initDate: DateTime(2024, 5),
              textColor: GpColors.background,
              defaultColor: GpColors.background.withOpacity(0.3),
              weekTextColor: GpColors.background,
              flexible: true,
              // size: 20,
              fontSize: 14,
              monthFontSize: 24,
              borderRadius: 30,

              colorMode: ColorMode.color,
              margin: const EdgeInsets.all(4),
              colorsets: const {
                1: GpColors.success,
                2: GpColors.error,
              },
              datasets: {
                DateTime(2024, 11, 26): 1,
                DateTime(2024, 11, 27): 2,
              },
              showColorTip: false,
            ),
          )
        ],
      ),
    );
  }
}
