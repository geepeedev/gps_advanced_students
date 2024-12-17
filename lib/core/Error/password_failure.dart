// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class PasswordFailure {
 String message;
  PasswordFailure(
    this.message,
  );
}

class PasswordTooShortFailure extends PasswordFailure {


  PasswordTooShortFailure() : super('Password too short');
}

// class UnknownPasswordFailure extends PasswordFailure {
//   final String message;

//   UnknownPasswordFailure({this.message = 'Unable to get password string'});
// }
