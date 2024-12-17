import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/Error/email_failure.dart';

class Email extends Equatable {
  final Either<EmailFailure, String> email;
  String emailValue() =>
      email.getOrElse((failure) => InvalidEmailFormatFailure().message);

  bool isfailure() => email.isLeft();

  

// contructors
  const Email._({required this.email});
 factory Email(String email) {
    
    return Email._(email: validateEmail(email));
  }

  @override
  List<Object?> get props => [email];
}

Either<InvalidEmailFormatFailure, String> validateEmail(String email) {
  final emailRegex = RegExp(
    r'^(?:[a-zA-Z0-9](?:[a-zA-Z0-9._%+-]*[a-zA-Z0-9])?@[a-zA-Z0-9](?:[a-zA-Z0-9.-]*[a-zA-Z0-9])?\.(?:[a-zA-Z]{2,}))$',
  );

  return emailRegex.hasMatch(email)
      ? right(email)
      : left(InvalidEmailFormatFailure());
}
