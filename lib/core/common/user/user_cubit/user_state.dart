// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

enum UserStatus { authenticated, unknown, unauthenticated }

class UserState extends Equatable {
  final UserStatus status;
  final UserModel? user;

  const UserState({this.status = UserStatus.unknown, this.user});
  // const UserState._({this.user, this.status = UserStatus.unknown});
  // const UserState.authenticated(UserModel user)
  //     : this._(status: UserStatus.authenticated, user: user);
  // const UserState.unknown() : this._();
  // const UserState.unauthenticated()
  //     : this._(status: UserStatus.unauthenticated);

  @override
  List<Object?> get props => [user, status];

  UserState copyWith({
    UserStatus? status,
    UserModel? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
