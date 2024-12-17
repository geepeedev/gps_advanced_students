part of 'internet_connection_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetLoading extends InternetState {}

final class InternetConnected extends InternetState {}

final class InternetDisconnected extends InternetState {}
