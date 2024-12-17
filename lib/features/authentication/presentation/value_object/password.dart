import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/Error/password_failure.dart';

class Password extends Equatable {
  final Either<PasswordFailure, String> password;

  const Password._({required this.password});

  String passwordValue() =>
      password.getOrElse((failure) => PasswordTooShortFailure().message);

  factory Password(String input) {
    return Password._(password: validatPasswordLength(input));
  }
  @override
  List<Object?> get props => [password];
}

Either<PasswordTooShortFailure, String> validatPasswordLength(String value) {
  if (value.length < 6) {
    return left(PasswordTooShortFailure());
  } else {
    return right(value);
  }
}
