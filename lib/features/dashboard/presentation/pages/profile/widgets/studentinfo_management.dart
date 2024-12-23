import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/profile_cubits/edit_student_info/student_edit_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/profile_cubits/student_info_cubit/student_info_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/r_student_info_widget.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/student_edit_widget.dart';
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
  int containerheight = 550;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerheight.toDouble(),
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 6,
        right: 6,
        left: 6,
      ),
      decoration: BoxDecoration(
        // color: Colors.white10,
        color: Colors.black,
        border: Border.all(color: GpColors.primary),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      // duration: const Duration(milliseconds: 200),
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
                          containerheight = 900;
                          stackindex = 1;
                        });
                        context.read<StudentEditCubit>().onEditStudentprofile();
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
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                          containerheight = 550;
                          stackindex = 0;
                        });
                        context.read<StudentInfoCubit>().onGetStudentInfo();
                      },
                      icon: const Icon(
                        IconsaxPlusLinear.additem,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(12),
              const StudentEditWidget()
            ],
          ),
        ],
      ),
    );
  }
}
