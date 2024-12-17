import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/student_info_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class StudentProfileWidget extends StatefulWidget {
  const StudentProfileWidget({
    super.key,
  });

  @override
  State<StudentProfileWidget> createState() => _StudentProfileWidgetState();
}

class _StudentProfileWidgetState extends State<StudentProfileWidget> {
  int stackindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 6,
        right: 6,
        left: 6,
      ),
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: IndexedStack(
        index: stackindex,
        children: [
          // column to view student info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GpText.headline(
                    text: 'Student Information',
                    textColor: GpColors.textlight,
                    fontsize: 35,
                  ),
                  // icon for editing
                  Card.filled(
                    color: GpColors.secondary,
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          stackindex = 1;
                        });
                      },
                      icon: const Icon(
                        IconsaxPlusLinear.user_edit,
                        size: 35,
                        color: GpColors.accent,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(12),
              const RStudentInfoWidget()
            ],
          ),

          // column for student info edit
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GpText.headline(
                    text: 'Edit Information',
                    textColor: GpColors.textlight,
                    fontsize: 35,
                  ),
                  // icon for editing
                  Card.filled(
                    color: GpColors.onPrimary,
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          stackindex = 0;
                        });
                      },
                      icon: const Icon(
                        IconsaxPlusLinear.additem,
                        size: 35,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
