import 'package:equatable/equatable.dart';

abstract class AuthSuccess extends Equatable {
  const AuthSuccess();
}

class LoginSuccess extends AuthSuccess {
  final String? title;
  final String? message;

  const LoginSuccess({this.title, this.message});

  @override
  List<Object?> get props => [title, message];
}

class SignoutSuccess extends AuthSuccess {
  final String? title;
  final String? message;

  const SignoutSuccess({this.title, this.message});

  @override
  List<Object?> get props => [title, message];
}
