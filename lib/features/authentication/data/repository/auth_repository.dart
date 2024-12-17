import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/Error/auth_failure.dart';
// import 'package:gps_advanced_students/core/Error/sign_out_failure.dart';
import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/features/authentication/data/source/auth_datasource.dart';

abstract class AuthRepository {
  TaskEither<AuthFailure, Unit> signOut();

  TaskEither<AuthFailure, UserModel> signInEmailAndPassword(
    String email,
    String password,
  );
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({required this.authDatasource});
  @override
  TaskEither<AuthFailure, UserModel> signInEmailAndPassword(
      String email, String password) {
    return authDatasource.signInEmailAndPassword(email, password);
  }

  @override
  TaskEither<AuthFailure, Unit> signOut() {
    return authDatasource.signOut();
  }

  // @override
  // TaskEither<SignOutFailure, Unit> signOut() {
  //   return authDatasource.signOut();
  // }
}
