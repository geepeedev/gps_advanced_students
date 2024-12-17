// import 'package:fpdart/fpdart.dart';
import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/features/authentication/data/source/auth_datasource.dart';

class UserRepository {
  final AuthDatasource authDatasource;

  UserRepository({required this.authDatasource});

  Stream<UserModel> userUpdate() {
    return authDatasource.onUserChanged;
  }
}
