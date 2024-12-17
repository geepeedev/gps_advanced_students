import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/core/Error/auth_failure.dart';
import 'package:gps_advanced_students/core/Success/auth_success.dart';
// import 'package:gps_advanced_students/core/Error/Auth_failures.dart';
// import 'package:gps_advanced_students/core/Error/auth_failure.dart';
import 'package:gps_advanced_students/core/network/network_repo.dart';
import 'package:gps_advanced_students/features/authentication/data/repository/auth_repository.dart';
import 'package:gps_advanced_students/features/authentication/presentation/value_object/email.dart';
import 'package:gps_advanced_students/features/authentication/presentation/value_object/password.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<SigninState> {
  AuthenticationCubit(
      {required this.internetChecker, required this.authRepository})
      : super(const SigninState());
  final AuthRepository authRepository;
  final InternetChecker internetChecker;

// password validation
  void onPassword(String input) {
    final password = Password(input);

    emit(state.copyWith(password: password, status: SigninStatus.initial));
  }

// email validation
  void onEmail(String input) {
    final email = Email(input);

    emit(state.copyWith(email: email, status: SigninStatus.initial));
  }

// sign out functionality
  void onSignout() async {
    final logoutData = await authRepository.signOut().run();
    logoutData.fold((error) {
      return SignoutAuthFailure(
          title: 'Sign out Error',
          message: 'Error occured whle trying to sign out');
    }, (signoutSuccess) {
      emit(
        state.copyWith(
          status: SigninStatus.success,
          success: const SignoutSuccess(
              title: 'Signout sucessful',
              message: "This user has successfully signed out "),
        ),
      );
    });
  }

// sign in functionality
  void onSignin() async {
    emit(
      state.copyWith(status: SigninStatus.loading),
    );
    final internet = await internetChecker.checkInternetFuture();
    if (internet.every((result) => result != ConnectivityResult.none)) {
      if (state.password != null && state.email != null) {
        if (state.password!.password.isRight() &&
            state.email!.email.isRight()) {
          final loginData = await authRepository
              .signInEmailAndPassword(
                  state.email!.emailValue(), state.password!.passwordValue())
              .run();

          loginData.fold(
            (failure) => emit(
                state.copyWith(failure: failure, status: SigninStatus.failure)),
            (userData) => emit(
              state.copyWith(
                  status: SigninStatus.success,
                  success: LoginSuccess(
                      title: 'Login success',
                      message: '${userData.email} has successfully logged in')),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SigninStatus.failure,
              failure: InvalidEmailOrPaswordFormatAuthFailure(
                title: 'Incorrect Email or Password format',
                error: 'Ensure your email and password have correct formatting',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            failure: NullEmailOrPasswordAuthFailure(
              title: 'Email or Password null',
              error: 'Please ensure you input your email and password',
            ),
            status: SigninStatus.failure,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
            failure: InvalidEmailOrPaswordFormatAuthFailure(
                title: 'No internet',
                error: 'Please ensure you have an internet connection'),
            status: SigninStatus.failure),
      );
    }
  }

 
}
