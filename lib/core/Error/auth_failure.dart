abstract class AuthFailure {
  const AuthFailure();

 
}

class AuthErrorAuthFailure extends AuthFailure {
  final String? message;
  final String statusCode;
  const AuthErrorAuthFailure(this.message, this.statusCode);
}

class ExecutionErrorAuthFailure extends AuthFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorAuthFailure(this.error, this.stackTrace);
}


class MissingUserIdAuthFailure extends AuthFailure {
  const MissingUserIdAuthFailure();
}

class NullEmailOrPasswordAuthFailure extends AuthFailure {
  final String title;
  final String error;

  NullEmailOrPasswordAuthFailure({required this.title, required this.error});
}

class InvalidEmailOrPaswordFormatAuthFailure extends AuthFailure {
  final String title;
  final String error;

  InvalidEmailOrPaswordFormatAuthFailure(
      {required this.title, required this.error});
}

class SignoutAuthFailure extends AuthFailure {
    final String title;
  final String? message;

  SignoutAuthFailure({required this.title, this.message});

 
}