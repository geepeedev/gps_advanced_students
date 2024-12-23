// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_edit_cubit.dart';

enum EditStatus { initial, success }

class EditStudentInfoState extends Equatable {
  final StudentProfileModel studentProfile;
  final EditStatus changeState;

  const EditStudentInfoState(
      {this.changeState = EditStatus.initial, required this.studentProfile});

  @override
  List<Object> get props => [studentProfile, changeState];

  EditStudentInfoState copyWith({
    StudentProfileModel? studentProfile,
    EditStatus? changeState,
  }) {
    return EditStudentInfoState(
      studentProfile: studentProfile ?? this.studentProfile,
      changeState: changeState ?? this.changeState,
    );
  }
}
