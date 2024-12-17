// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class EmailFailure {
  String message;
  EmailFailure(
  this.message,
  );
}

class InvalidEmailFormatFailure extends EmailFailure {


  InvalidEmailFormatFailure() : super('Wrong email format');
}


