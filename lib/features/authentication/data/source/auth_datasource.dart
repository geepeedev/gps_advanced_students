import 'package:fpdart/fpdart.dart';

import 'package:gps_advanced_students/core/Error/auth_failure.dart';

import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  final _firebase = FirebaseAuth.instance;

  AuthDatasource();

  // userUpdate from firebase
  Stream<UserModel> get onUserChanged =>
      FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
        return firebaseUser == null ? const  UserModel.empty() :
            UserModel(id: firebaseUser.uid, email: firebaseUser.email!);
      });
  // // update user information after password reset
  // updateUser(String password, String email) => TaskEither.tryCatch(
  //     () => _firebase
  //         .updateUser(UserAttributes(email: email, password: password)),
  //     (error, stackTrace) {});
// forget password reset
  // TaskEither<ForgetpasswordFailure, Unit> forgetPassword(String email) =>
  //     TaskEither.tryCatch(
  //       () async {
  //         await Fire.auth.resetPasswordForEmail(email);
  //         return unit;
  //       },
  //       (error, stackTrace) {
  //         if (error is AuthException) {
  //           return ForgetpasswordFailure();
  //         }
  //         return ForgetpasswordFailure();
  //       },
  //     );
// // session fo obtaining user information
//   Option<Session> get userSession =>
//       Option.fromNullable(_supabase.auth.currentSession);

  TaskEither<AuthFailure, Unit> signOut() => TaskEither.tryCatch(() async {
        await _firebase.signOut();
        return unit;
      }, (error, stackTrace) {
        if (error is FirebaseAuthException) {
          return SignoutAuthFailure(
            title: error.code,
            message: error.message,
          );
        }
        return ExecutionErrorAuthFailure(error, stackTrace);
      });
// sign in with email and password
  TaskEither<AuthFailure, UserModel> signInEmailAndPassword(
    String email,
    String password,
  ) =>
      TaskEither<AuthFailure, UserCredential>.tryCatch(
        () => _firebase.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
        (error, stackTrace) {
          if (error is FirebaseAuthException) {
            return AuthErrorAuthFailure(error.message, error.code);
          }

          return ExecutionErrorAuthFailure(error, stackTrace);
        },
      ).map((response) => response.user).flatMap(
            (user) => Either.fromNullable(
              UserModel(email: user!.email!, id: user.uid),
              () => const MissingUserIdAuthFailure(),
            ).toTaskEither(),
          );
}
