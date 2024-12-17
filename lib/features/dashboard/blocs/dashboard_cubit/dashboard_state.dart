// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({this.item = DraweritemEnum.classroom, this.index = 0});

  final int index;
  final DraweritemEnum item;
  @override
  List<Object> get props => [index, item];

  // DashboardState copyWith({
  //   int? index,
  // }) {
  //   return DashboardState(
  //     index: index ?? this.index,
  //   );
  // }

  DashboardState copyWith({
    int? index,
    DraweritemEnum? item,
  }) {
    return DashboardState(
      index: index ?? this.index,
      item: item ?? this.item,
    );
  }
}
