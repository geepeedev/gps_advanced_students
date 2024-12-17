// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gps_advanced_students/core/constants/enums/draweritem_enum.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void onPageselected(int index, DraweritemEnum item) {
    emit(
      state.copyWith(index: index),
    );
    if (state.item != item) {
      emit(
        state.copyWith(item: item),
      );
    }
  }
}
