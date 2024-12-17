part of 'student_info_cubit.dart';

sealed class StudentInfoState extends Equatable {
  const StudentInfoState();

  @override
  List<Object> get props => [];
}

final class StudentInfoInitial extends StudentInfoState {}

final class StudentInfoLoading extends StudentInfoState {}

final class StudentInfoData extends StudentInfoState {
  final StudentProfileModel profileInfo;

  const StudentInfoData({required this.profileInfo});
}

final class StudentInfoError extends StudentInfoState {
  final String error;

  const StudentInfoError({required this.error});
}
