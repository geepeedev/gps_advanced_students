import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/core/network/network_repo.dart';
import 'package:gps_advanced_students/features/dashboard/data/model/profile.dart';
import 'package:gps_advanced_students/features/dashboard/data/repository/dashboard_repository.dart';

part 'student_info_state.dart';

class StudentInfoCubit extends Cubit<StudentInfoState> {
  StudentInfoCubit(
      {required this.dashboardRepositoryImpl, required this.internetChecker})
      : super(StudentInfoInitial());

  final InternetChecker internetChecker;
  final DashboardRepositoryImpl dashboardRepositoryImpl;

  void initStudentprofile(UserModel user) async {
    emit(StudentInfoLoading());
    final localProfile =
        await dashboardRepositoryImpl.getStudentOfflineInfo().run();
    final internet = await internetChecker.checkInternetFuture();

    if (internet.every((connection) => connection != ConnectivityResult.none)) {
      localProfile.fold(
          (error) => debugPrint(error),
          (profile) async =>
            await  dashboardRepositoryImpl.updateStudentOnlineInfo(user, profile).run());
      final onlineProfile =
          await dashboardRepositoryImpl.getStudentOnlineInfo(user).run();
      onlineProfile.fold(
          (error) => emit(
                (StudentInfoError(error: error)),
              ), (studentProfile) async {
        emit(
          StudentInfoData(profileInfo: studentProfile),
        );
        await dashboardRepositoryImpl
            .updateStudentOfflineInfo(studentProfile)
            .run();
      });
    } else {
      localProfile.fold(
        (error) => emit(
          StudentInfoError(error: error),
        ),
        (studentLocalProfile) => emit(
          StudentInfoData(profileInfo: studentLocalProfile),
        ),
      );
    }
  }

  void onGetStudentInfo() async {
    emit(StudentInfoLoading());
    final studentprofile =
        await dashboardRepositoryImpl.getStudentOfflineInfo().run();
    studentprofile.fold((error) {
      emit(StudentInfoError(error: error));
    }, (profile) {
      emit(StudentInfoData(profileInfo: profile));
    });
  }

  @override
  void onChange(Change<StudentInfoState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
