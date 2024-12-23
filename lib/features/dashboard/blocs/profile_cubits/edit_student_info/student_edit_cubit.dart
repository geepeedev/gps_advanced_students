// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gps_advanced_students/features/dashboard/data/model/profile.dart';
import 'package:gps_advanced_students/features/dashboard/data/repository/dashboard_repository.dart';

part 'student_edit_state.dart';

class StudentEditCubit extends Cubit<EditStudentInfoState> {
  StudentEditCubit({required this.dashboardRepository})
      : super(const EditStudentInfoState(
            studentProfile: StudentProfileModel.empty()));
  final DashboardRepository dashboardRepository;

  void onEditStudentprofile() async {
    emit(state.copyWith(changeState: EditStatus.initial));
    final localProfile =
        await dashboardRepository.getStudentOfflineInfo().run();
    localProfile.fold((error) => null, (profile) {
      emit(EditStudentInfoState(studentProfile: profile));
    });
  }

  void onStudentInfoUpdated(String firstName, String lastName, String age,
      String dob, String origin, String address, String gender) async {
    emit(
      EditStudentInfoState(
        studentProfile: state.studentProfile.copyWith(
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dob,
            address: address,
            age: int.tryParse(age),
            stateOfOrigin: origin,
            gender: gender),
      ),
    );

    final data = await dashboardRepository
        .updateStudentOfflineInfo(state.studentProfile)
        .run();
    if (data.isRight()) {
      emit(state.copyWith(changeState: EditStatus.success));
    }
  }

  @override
  void onChange(Change<EditStudentInfoState> change) {
    // debugPrint(change.currentState.studentProfile.toString());
    debugPrint(change.toString());
    super.onChange(change);
  }
}
