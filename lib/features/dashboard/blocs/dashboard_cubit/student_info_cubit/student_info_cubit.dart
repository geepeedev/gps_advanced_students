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
    final onlineProfile =
        await dashboardRepositoryImpl.getStudentOnlineInfo(user).run();
    final internet = await internetChecker.checkInternetFuture();

    if (internet.every((connection) => connection != ConnectivityResult.none)) {
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
//
  // getProfileInfoFromFirebase(UserModel user) async {
  //   emit(StudentInfoLoading());
  //   final internet = await internetChecker.checkInternetFuture();

  //   if (internet.every((connection) => connection != ConnectivityResult.none)) {
  //     final networkFetch = await dashboardRepositoryImpl.dashboardDatasource
  //         .getStudentOnlineProfile()
  //         .run();
  //     networkFetch.fold((error) => emit(StudentInfoError(error: error)),
  //         (success) => emit(StudentInfoData(profileInfo: success)));
  //   } else {
  //     emit(const StudentInfoError(error: 'Intenet Connection needed'));
  //   }
  // }

  @override
  void onChange(Change<StudentInfoState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
