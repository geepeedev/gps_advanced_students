import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/profile_cubits/student_info_cubit/student_info_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/widgets/studentinfo_item.dart';

class RStudentInfoWidget extends StatelessWidget {
  const RStudentInfoWidget({
    super.key,
  });
  static List<String> gender = ['Female', 'Male'];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentInfoCubit, StudentInfoState>(
      builder: (context, state) {
        return switch (state) {
          StudentInfoInitial() => const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          StudentInfoLoading() => const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          StudentInfoError() => Expanded(
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1.7, color: GpColors.error),
                        color: GpColors.background),
                    padding: const EdgeInsets.all(12),
                    // color: GpColors.error,
                    child: GpText.body(
                      text: state.error,
                      textColor: GpColors.error,
                    )),
              ),
            ),
          StudentInfoData() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StudentInfoItemWidget(
                  itemLabel: 'First Name',
                  jsonData: state.profileInfo.firstName ?? '',
                ),
                StudentInfoItemWidget(
                  itemLabel: 'Last Name',
                  jsonData: state.profileInfo.lastName ?? '',
                ),
                StudentInfoItemWidget(
                  itemLabel: 'Gender',
                  jsonData: state.profileInfo.gender ?? '',
                ),
                StudentInfoItemWidget(
                  itemLabel: 'Age',
                  jsonData: state.profileInfo.age.toString(),
                ),
                StudentInfoItemWidget(
                  itemLabel: 'Date Of Birth',
                  jsonData: state.profileInfo.dateOfBirth ?? '',
                ),
                StudentInfoItemWidget(
                  itemLabel: 'State Of Origin',
                  jsonData: state.profileInfo.stateOfOrigin ?? '',
                ),
                StudentInfoItemWidget(
                  itemLabel: 'Address',
                  jsonData: state.profileInfo.address ?? '',
                ),
              ],
            ),
        };
      },
    );
  }
}
