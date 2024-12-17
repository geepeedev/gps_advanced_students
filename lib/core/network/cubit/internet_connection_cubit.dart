import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/core/network/network_repo.dart';
// import 'package:meta/meta.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetState> {
  final InternetChecker internet;
  late StreamSubscription internetStreamSubscription;
  InternetConnectionCubit({required this.internet}) : super(InternetLoading()) {
    internetStreamSubscription = internet.checkInternet
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.ethernet)) {
        emitInternetConnected();
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected() => emit(InternetConnected());
  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<InternetState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
