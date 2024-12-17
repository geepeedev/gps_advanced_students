// import 'package:bloc/bloc.dart';
import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/core/common/user/data/user_repo.dart';
// import 'package:gps_advanced_students/features/dashboard/data/source/dashboard_datasource.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  late final StreamSubscription<UserModel> userChangeStream;
  UserCubit(this.userRepository) : super(const UserState()) {
    userChangeStream = userRepository.userUpdate().listen((user) {
      onUserAuthChanged(user);
    });
  }
  void onUserAuthChanged(UserModel user) async {
    user == const UserModel.empty()
        ? emit(state.copyWith(user: null, status: UserStatus.unauthenticated))
        : emit(state.copyWith(user: user, status: UserStatus.authenticated));
  }

  @override
  void onChange(Change<UserState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }

  @override
  Future<void> close() {
    userChangeStream.cancel();
    return super.close();
  }
}
