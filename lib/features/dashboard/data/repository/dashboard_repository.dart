// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
// import 'package:gps_advanced_students/core/network/network_repo.dart';
import 'package:gps_advanced_students/features/dashboard/data/model/profile.dart';
import 'package:gps_advanced_students/features/dashboard/data/source/dashboard_datasource.dart';
import 'package:gps_advanced_students/features/dashboard/data/source/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:gps_advanced_students/features/dashboard/data/source/local_data_source.dart';

abstract class DashboardRepository {
// proflie functionality
  TaskEither<String, StudentProfileModel> getStudentOnlineInfo(
      UserModel currentUser);
  TaskEither<String, Unit> updateStudentOnlineInfo(
      UserModel currentUser, StudentProfileModel studentProfile);
  TaskEither<String, StudentProfileModel> getStudentOfflineInfo();
  TaskEither<String, Unit> updateStudentOfflineInfo(
      StudentProfileModel userProfile);
  // updateStudentProfileInFirestoreAndLocalDb();
}

class DashboardRepositoryImpl extends DashboardRepository {
  LocalDataSource localDataSource =
      LocalDataSource(preferencesAsync: SharedPreferencesAsync());
  DashboardDatasource dashboardDatasource;

  DashboardRepositoryImpl({required this.dashboardDatasource});

  @override
  TaskEither<String, StudentProfileModel> getStudentOfflineInfo() =>
      TaskEither.tryCatch(() async {
        return await localDataSource.getStudentProfile();
      }, (error, stackTrace) {
        return error.toString();
      }).flatMap((userData) =>
          TaskEither.fromNullable(userData, () => 'No item in local database')
              .map((changeModel) => StudentProfileModel.fromJson(changeModel)));

  @override
  TaskEither<String, StudentProfileModel> getStudentOnlineInfo(
          UserModel currentUser) =>
      TaskEither.tryCatch(() async {
        return await dashboardDatasource.getStudentOnlineProfile(currentUser);
      }, (error, stackTrace) {
        return error.toString();
      }).flatMap((result) =>
          TaskEither.fromNullable(result, () => 'User data not present')
              .map((userMap) => StudentProfileModel.fromMap(userMap)));

  @override
  TaskEither<String, Unit> updateStudentOfflineInfo(
          StudentProfileModel userProfile) =>
      TaskEither.tryCatch(() async {
        await localDataSource.updateStudentProfile(userProfile);
        return unit;
      }, (error, stackTrace) {
        return error.toString();
      });

  @override
  TaskEither<String, Unit> updateStudentOnlineInfo(
          UserModel currentUser, StudentProfileModel studentProfile) =>
      TaskEither.tryCatch(() async {
        await dashboardDatasource.updateStudentOnlineProfile(
            currentUser, studentProfile);
        return unit;
      }, (error, stackTrace) {
        return error.toString();
      });
}
