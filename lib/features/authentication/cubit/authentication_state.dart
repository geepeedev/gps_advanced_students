// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

enum SigninStatus { initial, loading, failure, success }

final class SigninState extends Equatable {
  final SigninStatus status;
  final Email? email;
  final bool isValid;
  final Password? password;
  final AuthFailure? failure;
  final AuthSuccess? success;

  const SigninState( {
    this.status = SigninStatus.initial,
    this.email,
    this.password,
    this.failure,
    this.isValid = true,
    this.success,
  });

  SigninState copyWith({
    Password? password,
    Email? email,
    SigninStatus? status,
    AuthFailure? failure,
    AuthSuccess? success,
    bool? isValid,
  }) {
    return SigninState(
      password: password ?? this.password,
      email: email ?? this.email,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      success: success ?? this.success
    );
  }

  @override
  List<Object?> get props => [status, password, email, password, success];
}
